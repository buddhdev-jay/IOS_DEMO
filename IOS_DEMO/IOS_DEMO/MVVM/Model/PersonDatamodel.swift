//
//  PersonDatamodel.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/04/22.
//

import Foundation

class PersonModel{
    public var name:String?
    public var password:String?
    public var email:String?
      
    init(name:String?, email:String?,password:String?) {
        self.name = name
        self.email = email
        self.password = password
    }
}
