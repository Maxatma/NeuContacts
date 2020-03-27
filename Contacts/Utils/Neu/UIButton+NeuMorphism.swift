//
//  UIButton+NeuMorphism.swift
//  Contacts
//
//  Created by Zaporozhchenko Oleksandr on 3/26/20.
//  Copyright © 2020 Aleksandr Zaporozhchenko. All rights reserved.
//

import UIKit


extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                setHighLighted()
            } else {
                resetState()
            }
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            if isEnabled {
                resetState()
            } else {
                setDisabled()
            }
        }
    }
    
    func setDisabled() {
        
        if let neuBlackLayer = layer.sublayers?.first(where: { $0.name == "neuBlack" }) {
            neuBlackLayer.shadowOffset = CGSize(width: 0, height: 0)
            neuBlackLayer.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 0.5).cgColor
        }
        
        if let neuWhiteLayer = layer.sublayers?.first(where: { $0.name == "neuWhite" }) {
            neuWhiteLayer.shadowOffset = CGSize(width: 0, height: 0)
            neuWhiteLayer.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 0.5).cgColor
        }
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        titleLabel?.alpha = 0.5
    }
    
    func setHighLighted() {
        
        if let neuBlackLayer = layer.sublayers?.first(where: { $0.name == "neuBlack" }) {
            neuBlackLayer.shadowOffset = CGSize(width: -2, height: -2)
        }
        
        if let neuWhiteLayer = layer.sublayers?.first(where: { $0.name == "neuWhite" }) {
            neuWhiteLayer.shadowOffset = CGSize(width: 2, height: 2)
        }
        
        contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 0, right: 0)
        titleLabel?.alpha = 1
    }
    
    func resetState() {
        if let neuBlackLayer = layer.sublayers?.first(where: { $0.name == "neuBlack" }) {
            neuBlackLayer.shadowOffset = CGSize(width: 2, height: 2)
            neuBlackLayer.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1).cgColor
        }
        
        if let neuWhiteLayer = layer.sublayers?.first(where: { $0.name == "neuWhite" }) {
            neuWhiteLayer.shadowOffset = CGSize(width: -2, height: -2)
            neuWhiteLayer.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1).cgColor
        }
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 2)
        titleLabel?.alpha = 1
    }
    
    public func applyNeumorphismStyleButton(cornerRadius: CGFloat = 15.0,
                                            themeColor: UIColor = .init(red: 0.96, green: 0.96, blue: 0.97, alpha: 1)) {
        
        super.applyNeumorphismStyle()
        
        if !isEnabled {
            setDisabled()
        }
    }
}

