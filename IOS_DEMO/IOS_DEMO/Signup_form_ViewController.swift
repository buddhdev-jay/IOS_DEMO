//
//  Signup_form_ViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 28/02/22.
//

import UIKit

class Signup_form_ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        nameField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension Signup_form_ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            nameField.becomeFirstResponder()
        case nameField:
            nameField.resignFirstResponder()
        default :
            break
        }
        return true
    }
}
