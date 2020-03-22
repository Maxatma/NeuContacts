//
//  SelectableTableCell.swift
//  
//
//  Created by Alexander Zaporozhchenko on 6/16/17.
//  Copyright © 2017 Alexander Zaporozhchenko. All rights reserved.
//

import Bond
import ReactiveKit


public protocol SelectableProtocol: RCVMProtocol {
    var doSelect: SafePublishSubject<Void> { get }
}

public protocol SelectableSelectedProtocol: SelectableProtocol {
    var selected: Observable<Bool> { get }
}


class SelectableTableCell: RCTableCell {
    let doSelect = SafePublishSubject<Void>()
    
    var selectableVM: SelectableProtocol {
        return viewModel as! SelectableProtocol
    }
    
    override func  advise() {
        super.advise()
        doSelect
            .throttle(seconds: 1)
            .bind(to: selectableVM.doSelect)
            .dispose(in: bag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            doSelect.next(())
        }
    }
}

