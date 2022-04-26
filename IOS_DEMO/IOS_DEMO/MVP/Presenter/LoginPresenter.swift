//
//  LoginPresenter.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import Foundation

protocol PresenterView: class {
    func updateLogin()
    func wrongLogin()
}

class LoginPresenter {
    
    // MARK: - Variables
    weak var presenterView:PresenterView?
    var userName:String?
    var password:String?
    
    init(view:PresenterView){
        self.presenterView = view
    }
    
    func submitButtonClicked(){
        if(self.userName == Constants.rootUserNameandPassword && self.password == Constants.rootUserNameandPassword) {
            let userModel = UserModel(name:self.userName, password:password)
            self.presenterView?.updateLogin()
        } else {
            self.presenterView?.wrongLogin()
        }
    }
}
