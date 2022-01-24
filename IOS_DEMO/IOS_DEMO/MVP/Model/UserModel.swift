//
//  UserModel.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import Foundation

class UserModel{
    public var userName:String?
    public var password:String?
      
    init(name:String?, password:String?) {
        self.userName = name
        self.password = password
    }
}  
