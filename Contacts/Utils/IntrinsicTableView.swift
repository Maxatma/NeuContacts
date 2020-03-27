//
//  IntrinsicTableView.swift
//  Contacts
//
//  Created by Zaporozhchenko Oleksandr on 3/25/20.
//  Copyright © 2020 Aleksandr Zaporozhchenko. All rights reserved.
//

import UIKit


class IntrinsicTableView: UITableView {
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
