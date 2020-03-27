//
//  NeuTF.swift
//  Contacts
//
//  Created by Zaporozhchenko Oleksandr on 3/26/20.
//  Copyright © 2020 Aleksandr Zaporozhchenko. All rights reserved.
//

import UIKit


final class NeuTF: UITextField {
    @IBInspectable var insetX: CGFloat = 15
    @IBInspectable var insetY: CGFloat = 15
        
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyNeumorphismStyle()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}

