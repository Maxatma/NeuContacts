//
//  ContactCell.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond


final class ContactCell: RCTableCell {
    
    var vm: ContactCellVM {
        return viewModel as! ContactCellVM
    }
    
    @IBOutlet var name: UILabel!
    @IBOutlet var container: UIView!
    @IBOutlet var separator: UIView!

    override func advise() {
        vm.name.bind(to: name).dispose(in: bag)
        vm.isSeparatorHidden.bind(to: separator.reactive.isHidden).dispose(in: bag)
    }
}

