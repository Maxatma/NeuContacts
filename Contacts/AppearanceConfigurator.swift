//
//  AppearanceConfigurator.swift
//  Contacts
//
//  Created by Zaporozhchenko Oleksandr on 3/27/20.
//  Copyright © 2020 Aleksandr Zaporozhchenko. All rights reserved.
//

import UIKit


final class AppearanceConfigurator {
    static let shared = AppearanceConfigurator()
    
    func configure() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = .init(red: 0.96, green: 0.96, blue: 0.97, alpha: 1)
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.shadowImage = UIImage()
        let backButtonImage = UIImage(named: "boldBack")
        navigationBarAppearace.backIndicatorImage = backButtonImage
        navigationBarAppearace.backIndicatorTransitionMaskImage = backButtonImage
        navigationBarAppearace.tintColor = .init(red: 0.74, green: 0.75, blue: 0.76, alpha: 1)
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.74, green: 0.75, blue: 0.76, alpha: 1)]
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        barButtonAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        barButtonAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
    }
}

