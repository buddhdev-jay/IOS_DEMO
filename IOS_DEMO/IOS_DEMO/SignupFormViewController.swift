//
//  SignupFormViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 26/04/22.
//

import UIKit

class SignupFormViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var termsandconstionLabel: UILabel!
    var viewingPassword = true
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupFormViewController.tappedMe))
        self.hideKeyboardWhenTappedAround()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    @IBAction func onClickofShowPassword(_ sender: UIButton) {
        debugPrint("Hello")
    }
    @IBAction func onClickFacebookbtn(_ sender: UIButton) {
        alert(customMessage: Constants.signupFacebook)
    }
    @IBAction func onClickGooglebtn(_ sender: UIButton) {
        alert(customMessage:Constants.sigupGoogle )
    }
    @IBAction func onClickSignupbtn(_ sender: UIButton) {
        alert(customMessage: Constants.signupbtn)
    }
}

// MARK: -  UITextFieldDelegate
extension SignupFormViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField :
            nameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        case emailTextField :
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField :
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}

// MARK: -  SignupFormViewController
extension SignupFormViewController {
    @objc func tappedMe() {
        passwordTextField.isSecureTextEntry = viewingPassword ? false : true
        viewingPassword.toggle()
    }
}

// MARK: -  SignupFormViewController
extension SignupFormViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupFormViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

