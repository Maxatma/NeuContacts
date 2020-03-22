//
//  Router+Contacts.swift
//  Contacts
//
//  Created by Zaporozhchenko Oleksandr on 3/23/20.
//  Copyright © 2020 Aleksandr Zaporozhchenko. All rights reserved.
//

import Foundation


extension Router {
    
    func showContacts() {
        let controller: ContactsVC = self.mainStoryboard.instantiate()
        controller.viewModel       = ContactsVM()
        self.push(controller)
    }
    
    func showContactWith(id: ID) {
        let controller: ContactInfoVC = self.mainStoryboard.instantiate()
        controller.viewModel          = ContactInfoVM(modelID: id)
        self.push(controller)
    }
    
    func showContactCreation()  {
        let controller: ContactCreationVC = self.mainStoryboard.instantiate()
        controller.viewModel              = ContactCreationVM()
        self.push(controller)
    }
}

