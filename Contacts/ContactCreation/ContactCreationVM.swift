//
//  ContactCreationVM.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class ContactCreationVM: RCViewModel {
    
    let firstName       = Observable<String>("")
    let lastName        = Observable<String>("")
    let phoneNumber     = Observable<String>("")
    let streetAddress1  = Observable<String>("")
    let streetAddress2  = Observable<String>("")
    let city            = Observable<String>("")
    let state           = Observable<String>("")
    let zipCode         = Observable<String>("")
    let create          = SafePublishSubject<Void>()
    let creationEnabled = Observable<Bool>(false)
    
    override init() {
        super.init()
        
        let fieldSignals = [firstName, lastName, phoneNumber, streetAddress1, streetAddress2, city, state, zipCode]
            .map { $0.toSignal()}
        
        combineLatest(fieldSignals) { element -> Bool in
            return element.reduce(true, { value, nextValue in
                return value && (nextValue.count > 0)
            })
            }
            .bind(to: creationEnabled)
        
        
        create.observeNext { [weak self] _ in
            guard let me = self else { return }
            
            let contact = Contact()
            contact.contactID      = UUID().uuidString
            contact.firstName      = me.firstName.value
            contact.lastName       = me.lastName.value
            contact.phoneNumber    = me.phoneNumber.value
            contact.streetAddress1 = me.streetAddress1.value
            contact.streetAddress2 = me.streetAddress2.value
            contact.city           = me.city.value
            contact.state          = me.state.value
            contact.zipCode        = me.zipCode.value
            DataModel<Contact>().save(entity: contact)
            Router.shared.poptoRoot()
            }
            .dispose(in: bag)
    }
}

