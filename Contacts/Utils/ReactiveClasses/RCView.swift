//
//  RCView.swift
//  
//
//  Created by Alexander Zaporozhchenko on 5/23/17.
//  Copyright © 2017 Alexander Zaporozhchenko. All rights reserved.
//

import Bond


class RCView: UIView {
    private var _viewModel: RCVMProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    var viewModel: RCVMProtocol? {
        get {
            return _viewModel;
        }
        set(newViewModel) {
            if(_viewModel !== newViewModel) {
                unadvise();
                _viewModel = newViewModel;
                if _viewModel != nil {
                    advise();
                }
            }
        }
    }
    
    deinit {
        viewModel = nil
    }
    
    // called to dispose binds needed for view

    func unadvise() {
        bag.dispose()
        let views = subviews.compactMap { $0 as? RCView }
        for view in views {
            view.viewModel = nil
        }
    }
    
    // called to bind needed for view

    func advise() {
    }
}

