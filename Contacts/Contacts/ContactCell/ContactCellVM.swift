//
//  ContactCellVM.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class ContactCellVM: RCViewModel {
    
    let name = Observable<String>("")
    
    private var model: Contact?
    var modelID: String!

    required init(model: Contact) {
        super.init()
        self.model    = model
        self.modelID  = model.contactID ?? ""

        let lastname  = model.lastName ?? ""
        let firstName = model.firstName ?? ""
        name.next(firstName + " " + lastname)
    }
}

