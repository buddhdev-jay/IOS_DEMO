//
//  LoginPresenter.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import Foundation

protocol PresenterView:class {
    func updateLogin()
    func wrongLogin()
}

class LoginPresenter{
    weak var presenterView:PresenterView?
    var userName:String?
    var password:String?
    
    init(view:PresenterView){
        self.presenterView = view
    }
    
    func submitButtonClicked(){
        if(self.userName == "root" && self.password == "root") {
            let userModel = UserModel(name:self.userName, password:password)
            self.presenterView?.updateLogin()
        } else {
            self.presenterView?.wrongLogin()
        }
    }
}
