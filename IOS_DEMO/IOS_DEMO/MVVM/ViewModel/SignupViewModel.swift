//
//  SignupViewModel.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/04/22.
//

import Foundation

class SignupViewModel : NSObject {
    
    var onValidationError: ((String) -> Void)?
    var onSignupSuccess: (()-> Void)?
    
    func validate(email: String, password: String, name : String) {
        if email.isEmpty {
            onValidationError?("Please enter email")
        } else if password.isEmpty {
            onValidationError?("Please enter password")
        } else if name.isEmpty {
            onValidationError?("Please enter password")
        } else {
            performSignup(email: email, password:password, name: name)
        }
    }
    
    func performSignup(email: String, password: String, name: String) {
        let person = PersonModel(name:name,email:email,password:password)
        onSignupSuccess?()
    }
}
