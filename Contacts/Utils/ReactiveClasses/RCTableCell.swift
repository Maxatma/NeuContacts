//
//  RCTableCell.swift
//  
//
//  Created by Alexander Zaporozhchenko on 5/23/17.
//  Copyright © 2017 Alexander Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


class RCTableCell: UITableViewCell {
    
    let onReuseBag = DisposeBag()
    
    override func prepareForReuse() {
        onReuseBag.dispose()
    }

    private var model: RCVMProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var viewModel: RCVMProtocol? {
        get {
            return model;
        }
        set(newViewModel) {
            if model !== newViewModel {
                unadvise()
                model = newViewModel
                if model != nil {
                    advise()
                }
            }
        }
    }
    deinit {
        viewModel = nil
    }
    
    //called to bind needed for cell
    func advise() {
        
    }
    
    //called to dispose binds needed for cell
    func unadvise() {
        bag.dispose()
        let views = subviews.compactMap { $0 as? RCView }
        for view in views {
            view.viewModel = nil
        }
    }
}

