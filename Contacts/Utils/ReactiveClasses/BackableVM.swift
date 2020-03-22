//
//  BackableVM.swift
//  
//
//  Created by Alexandr on 7/22/17.
//  Copyright © 2017 Alexander Zaporozhchenko. All rights reserved.
//

import ReactiveKit


public protocol Backable: RCVMProtocol {
    var back: SafePublishSubject<Void> { get }
}

class BackableVM: RCViewModel, Backable {
    let back = SafePublishSubject<Void>()
    
    public override init(){
        super.init()
        
        back
            .observeNext { Router.shared.pop() }
            .dispose(in: bag)
    }
}

