//
//  ContactCreationVC.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


final class ContactCreationVC: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var streetAddress1: UITextField!
    @IBOutlet weak var streetAddress2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    @IBOutlet weak var create: UIButton!
    
    var viewModel: ContactCreationVM!
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        
        firstName.reactive.text.ignoreNil().bind(to: viewModel.firstName).dispose(in: bag)
        lastName.reactive.text.ignoreNil().bind(to: viewModel.lastName).dispose(in: bag)
        phoneNumber.reactive.text.ignoreNil().bind(to: viewModel.phoneNumber).dispose(in: bag)
        streetAddress1.reactive.text.ignoreNil().bind(to: viewModel.streetAddress1).dispose(in: bag)
        streetAddress2.reactive.text.ignoreNil().bind(to: viewModel.streetAddress2).dispose(in: bag)
        city.reactive.text.ignoreNil().bind(to: viewModel.city).dispose(in: bag)
        state.reactive.text.ignoreNil().bind(to: viewModel.state).dispose(in: bag)
        zipCode.reactive.text.ignoreNil().bind(to: viewModel.zipCode).dispose(in: bag)
        
        create.reactive.tap.bind(to: viewModel.create).dispose(in: bag)
        viewModel.creationEnabled.bind(to: create.reactive.isEnabled).dispose(in: bag)
    }
    
    //MARK: - Private
}

