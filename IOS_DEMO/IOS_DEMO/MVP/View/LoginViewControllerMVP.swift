//
//  LoginViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import UIKit

class LoginViewControllerMVP: UIViewController {
    
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    lazy var presenter = LoginPresenter(view:self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickedSubmitBtn(_ sender: Any) {
        presenter.userName = userEmail.text
        presenter.password = userPassword.text
        presenter.submitButtonClicked()
    }
}

extension LoginViewControllerMVP : PresenterView {
    
    func updateLogin() {
        let alertController = UIAlertController(title: "Login Success", message:
                                                    "email and Password is Correct", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func wrongLogin() {
        let alertController = UIAlertController(title: "Login Failed", message:
                                                    "email and Password is InCorrect", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
