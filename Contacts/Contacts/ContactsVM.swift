//
//  ContactsVM.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit
import RealmSwift


final class ContactsVM: RCViewModel {
    var contactsVMS = MutableObservableArray<ContactCellVM>()
    let addContact  = SafePublishSubject<Void>()
    let showContact = SafePublishSubject<String>()
    let refresh     = SafePublishSubject<Void>()
    
    override init() {
        super.init()
        refreshContacts()
        
        addContact
            .observeNext {
                Router.shared.showContactCreation()
            }
            .dispose(in: bag)
        
        showContact
            .observeNext {
                Router.shared.showContactWith(id: $0)
            }
            .dispose(in: bag)
        
        refresh
            .observeNext { [weak self] _ in
                guard let me = self else { return }
                me.refreshContacts()
            }
            .dispose(in: bag)
    }
    
    private func refreshContacts() {
        do {
            var contacts = try Array(Realm().objects(Contact.self))
            let lastItem = contacts.removeLast()
            var vms = contacts.map { ContactCellVM(model: $0) }
            vms.append(ContactCellVM(model: lastItem, isLast: true))
            contactsVMS.replace(with: vms)
        } catch {
            Router.shared.showAlert(message: error.localizedDescription)
        }
    }
}

