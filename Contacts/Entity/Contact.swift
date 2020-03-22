//
//  Contact.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/21/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import RealmSwift
import ObjectMapper


 class Contact: DBObject, Mappable {
    
    override static func primaryKey() -> String? {
        return "contactID"
    }
    
    @objc dynamic var contactID: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var phoneNumber: String?
    @objc dynamic var streetAddress1: String?
    @objc dynamic var streetAddress2: String?
    @objc dynamic var city: String?
    @objc dynamic var state: String?
    @objc dynamic var zipCode: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        contactID <- map["contactID"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        phoneNumber <- map["phoneNumber"]
        streetAddress1 <- map["streetAddress1"]
        streetAddress2 <- map["streetAddress2"]
        city <- map["city"]
        state <- map["state"]
        zipCode <- map["zipCode"]
    }
}

