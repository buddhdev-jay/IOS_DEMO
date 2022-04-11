//
//  SignupMVVMViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/04/22.
//

import UIKit

class SignupMVVMViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator : MVVMCoordinator?
    let viewModel = SignupViewModel()
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        // Do any additional setup after loading the view.
    }
    func bindViewModel(){
        viewModel.onValidationError = { error in
            print(error)
        }
        viewModel.onSignupSuccess = {
            self.coordinator?.goToLogin()
        }
    }
    @IBAction func onSignupClick(_ sender: UIButton) {
        viewModel.validate(email: emailText.text ?? " ", password: passwordText.text ?? " " , name: nameText.text ?? " ")
    }
}
