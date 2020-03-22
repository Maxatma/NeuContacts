//
//  ContactInfoVM.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class ContactInfoVM: RCViewModel {
    
    let firstName       = Observable<String>("")
    let lastName        = Observable<String>("")
    let phoneNumber     = Observable<String>("")
    let streetAddress1  = Observable<String>("")
    let streetAddress2  = Observable<String>("")
    let city            = Observable<String>("")
    let state           = Observable<String>("")
    let zipCode         = Observable<String>("")
    
    let delete          = SafePublishSubject<Void>()
    
    init(modelID: String) {
        super.init()
        let datamodel = DataModel<Contact>()
        let model = datamodel.getEntity(id: modelID)!
        
        firstName.next(model.firstName ?? "")
        lastName.next(model.lastName ?? "")
        phoneNumber.next(model.phoneNumber ?? "")
        streetAddress1.next(model.streetAddress1 ?? "")
        streetAddress2.next(model.streetAddress2 ?? "")
        city.next(model.city ?? "")
        state.next(model.state ?? "")
        zipCode.next(model.zipCode ?? "")
        
        delete
            .observeNext {
                datamodel.delete(entityWithId: modelID)
                Router.shared.poptoRoot()
            }
            .dispose(in: bag)
    }
}

