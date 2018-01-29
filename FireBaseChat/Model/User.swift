//
//  User.swift
//  FireBaseChat
//
//  Created by Alan Casas on 29/1/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import Foundation

class User : NSObject{
    var name:String?
    var email: String?
    
    
    init(name: String, email: String) {
        (self.name, self.email) = (name, email)
    }

    override init() {
    }
}

