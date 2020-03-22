//
//  Realm+Extensions.swift
//
//
//  Created by Alexander Zaporozhchenko on 6/20/17.
//  Copyright © 2017 Alexander Zaporozhchenko. All rights reserved.
//

import RealmSwift


extension Realm {
    public func safeWrite(_ block:  (()  -> Void))  {
        if isInWriteTransaction {
            block()
        } else {
          try!  write(block)
        }
    }
}

