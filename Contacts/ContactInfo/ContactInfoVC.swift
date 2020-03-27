//
//  ContactInfoVC.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//

import Bond


final class ContactInfoVC: UIViewController {
    var viewModel: ContactInfoVM!
    
    @IBOutlet weak var container: UIStackView!
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var streetAddress1: UILabel!
    @IBOutlet weak var streetAddress2: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    @IBOutlet weak var delete: UIButton!
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.title = "Contact Details"
        
        viewModel.firstName.bind(to: firstName.reactive.text).dispose(in: bag)
        viewModel.lastName.bind(to: lastName.reactive.text).dispose(in: bag)
        viewModel.phoneNumber.bind(to: phoneNumber.reactive.text).dispose(in: bag)
        viewModel.streetAddress1.bind(to: streetAddress1.reactive.text).dispose(in: bag)
        viewModel.streetAddress2.bind(to: streetAddress2.reactive.text).dispose(in: bag)
        viewModel.city.bind(to: city.reactive.text).dispose(in: bag)
        viewModel.state.bind(to: state.reactive.text).dispose(in: bag)
        viewModel.zipCode.bind(to: zipCode.reactive.text).dispose(in: bag)
        
        delete.reactive.tap.bind(to: viewModel.delete).dispose(in: bag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delete.applyNeumorphismStyleButton()
        container.applyNeumorphismStyle()
    }
    
    //MARK: - Private
}

