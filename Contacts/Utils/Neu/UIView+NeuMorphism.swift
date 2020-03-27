//
//  UIView+NeuMorphism.swift
//  Contacts
//
//  Created by Zaporozhchenko Oleksandr on 3/26/20.
//  Copyright © 2020 Aleksandr Zaporozhchenko. All rights reserved.
//


import UIKit

extension UIView {
    
    public func applyNeumorphismStyle(cornerRadius: CGFloat = 15.0,
                                       themeColor: UIColor = .init(red: 0.96, green: 0.96, blue: 0.97, alpha: 1)) {
        
        guard let sublayers = layer.sublayers else { return }
        
        if let shadowLayer = sublayers.first(where: { $0.name == "neuBlack" }) {
            shadowLayer.frame = bounds
            shadowLayer.backgroundColor = themeColor.cgColor
            shadowLayer.shadowColor = UIColor(red: 0.87, green: 0.867, blue: 0.933, alpha: 1).cgColor
            shadowLayer.cornerRadius = cornerRadius
            shadowLayer.shadowOffset = CGSize(width: 2, height: 2)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 2
        } else {
            let shadowLayer = CAShapeLayer()
            shadowLayer.name = "neuBlack"
            shadowLayer.frame = bounds
            shadowLayer.backgroundColor = themeColor.cgColor
            shadowLayer.shadowColor = UIColor(red: 0.87, green: 0.867, blue: 0.933, alpha: 1).cgColor
            shadowLayer.cornerRadius = cornerRadius
            shadowLayer.shadowOffset = CGSize(width: 2, height: 2)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 2
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
        
        if let shadowLayer = sublayers.first(where: { $0.name == "neuWhite" }) {
            shadowLayer.frame = bounds
            shadowLayer.backgroundColor = themeColor.cgColor
            shadowLayer.shadowColor = UIColor.white.cgColor
            shadowLayer.cornerRadius = cornerRadius
            shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 2
        } else {
            let shadowLayer = CAShapeLayer()
            shadowLayer.name = "neuWhite"
            shadowLayer.frame = bounds
            shadowLayer.backgroundColor = themeColor.cgColor
            shadowLayer.shadowColor = UIColor.white.cgColor
            shadowLayer.cornerRadius = cornerRadius
            shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 2
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    

}


