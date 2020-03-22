//
//  RCViewModel.swift
//
//
//  Created by Alexander Zaporozhchenko on 5/23/17.
//  Copyright © 2017 Alexander Zaporozhchenko. All rights reserved.
//

import ReactiveKit
import Bond


public protocol RCVMProtocol : class { }

public class RCViewModel: NSObject, RCVMProtocol {
    
    public override init(){
        super.init()
    }
}

