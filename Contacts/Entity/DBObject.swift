//
//  DBObject.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/21/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import RealmSwift
import ObjectMapper


open class DBObject: Object, BaseMappable {
    public func mapping(map: Map) {
        print("should be used in child classes")
    }
}

