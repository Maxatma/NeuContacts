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
    
    private var model: Contact?
    var modelID: String!

    let name = Observable<String>("")
    let isSeparatorHidden = Observable<Bool>(false)

    required init(model: Contact, isLast: Bool = false) {
        super.init()
        self.model    = model
        self.modelID  = model.contactID ?? ""

        let lastname  = model.lastName ?? ""
        let firstName = model.firstName ?? ""
        name.next(firstName + " " + lastname)
        isSeparatorHidden.next(isLast)
    }
}

