//
//  RCTableView.swift
//  
//
//  Created by Alexander Zaporozhchenko on 6/12/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import Bond


class RCTableView: UITableView {
    private var _viewModel: RCVMProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
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

