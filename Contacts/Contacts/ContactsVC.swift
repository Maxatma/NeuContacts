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
    
    var viewModel: ContactsVM!
    
    @IBOutlet weak var table: IntrinsicTableView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var add: UIButton!
    
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        container.applyNeumorphismStyle()
        add.applyNeumorphismStyleButton()
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
        
        let footer = UIView()
        footer.backgroundColor = .clear
        table.tableFooterView = footer
    }
}

