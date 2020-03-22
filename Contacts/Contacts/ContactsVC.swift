//
//  ContactsVC.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class ContactsVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var add: UIBarButtonItem!
    
    var viewModel: ContactsVM!
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ContactsVM()
        configureTable()
        add.reactive.tap.bind(to: viewModel.addContact).dispose(in: bag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refresh.next()
        
    }
    
    //MARK: - Private
    
    private func configureTable() {
        
        table.registerNibsFor(classes: [ContactCell.self])
        
        viewModel.contactsVMS
            .bind(to: table) { vms, indexPath, tableView in
                let cell       = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
                cell.viewModel = vms[indexPath.row]
                return cell
        }
        .dispose(in: bag)
        
        table.selectedRow.bind(to: self) { me, idx in
            let modelID = me.viewModel.contactsVMS[idx].modelID!
            me.viewModel.showContact.next(modelID)
        }
        
        table.tableFooterView = UIView()
    }
}

