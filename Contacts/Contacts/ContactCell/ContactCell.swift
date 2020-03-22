//
//  ContactCell.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Foundation
import Bond


final class ContactCell: RCTableCell {
    
    var vm: ContactCellVM {
        return viewModel as! ContactCellVM
    }
    
    @IBOutlet weak var name: UILabel!
    
    override func advise() {
        vm.name.bind(to: name).dispose(in: bag)
    }
}

