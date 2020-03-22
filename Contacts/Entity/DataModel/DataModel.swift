//
//  Contact.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/21/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import RealmSwift
import ReactiveKit
import ObjectMapper


enum DataModelError: Error {
    case databaseLoadProblem
    case mapFailed
}


class DataModel<E: DBObject> {
    
    typealias ID = String
    
    private func loadRealm() throws -> Realm {
        
        do {
            let realm = try Realm()
            return realm
        }
        catch  {
            throw DataModelError.databaseLoadProblem
        }
    }
    
    func saveEntities(jsonString: String) -> [ID] {
        
        let realm = try! self.loadRealm()
        
        guard let entities = Mapper<E>().mapArray(JSONString: jsonString) else {
            return []
        }
        
        realm.safeWrite {
            realm.add(entities, update: Realm.UpdatePolicy.all)
//            realm.add(entities, update: true)
        }
        
        let primaryKey = E.primaryKey()!
        
        return entities.compactMap { $0.value(forKey: primaryKey) as? String  }
    }
    
    func getAll() -> [E] {
        let realm = try! loadRealm()
        realm.refresh()
        
        return Array(realm.objects(E.self))
    }
    
    func getEntities(ids: [ID]) -> [E] {
        let realm = try! loadRealm()
        realm.refresh()
        
        
        let predicate = NSPredicate(format: "id IN %@", ids)
        let result    = realm.objects(E.self).filter(predicate)
        
        return Array(result)
    }
    
    func getEntity(id: ID?) -> E? {
        
        guard id != nil else {
            return nil
        }
        
        let realm = try! loadRealm()
        realm.refresh()
        guard let realmEntity = realm.object(ofType: E.self, forPrimaryKey: id) else  {
            return nil
        }
        return realmEntity
    }
    
    func save(entity: E) {
        let realm = try! loadRealm()
        realm.safeWrite {
            realm.add(entity)
        }
    }
    
    func delete(entityWithId id: ID) {
        let realm = try! loadRealm()
        if let object = getEntity(id: id) {
            realm.safeWrite {
                realm.delete(object)
            }
        }
    }
}
