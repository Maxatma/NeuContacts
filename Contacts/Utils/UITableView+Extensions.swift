//
//  UITableView+Extensions.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import UIKit


extension UITableView {
    
    func registerNibsFor(classes: [AnyClass]) {
        classes.forEach { (cellClass) in
            let cellId = String(describing: cellClass)
            let nib    = UINib(nibName: cellId, bundle: Bundle.main)
            self.register(nib, forCellReuseIdentifier: cellId)
        }
    }
}

