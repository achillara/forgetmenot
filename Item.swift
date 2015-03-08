//
//  Item.swift
//  Forget Me Not
//
//  Created by Anusha Chillara on 2/17/15.
//  Copyright (c) 2015 Chillara. All rights reserved.
//

import Foundation

class Item: NSObject {
    var name: String
    init(name:String){
        self.name = name
        super.init()
    }
}