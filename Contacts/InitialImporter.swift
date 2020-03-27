//
//  InitialImporter.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import RealmSwift


final class InitialImporter {
    
    typealias ID = String
    
    static let shared = InitialImporter()
    
    func importDataBase() {
        guard let path = Bundle.main.path(forResource: "tenpersons", ofType: "json") else { return }
        do {
            let text = try String(contentsOfFile: path)
            let contactsDataModel = DataModel<Contact>()
            _ = contactsDataModel.saveEntities(jsonString: text)
        }
        catch {
            print("loading file error: ", error)
        }
    }
}

