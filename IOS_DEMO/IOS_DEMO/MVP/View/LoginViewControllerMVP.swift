//
//  LoginViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import UIKit

class LoginViewControllerMVP: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    // MARK: - Variables
    lazy var presenter = LoginPresenter(view:self)
    
    // MARK: - LifeCycle Activity
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Outlet Action
extension LoginViewControllerMVP {
    
    @IBAction func clickedSubmitBtn(_ sender: Any) {
        presenter.userName = userEmail.text
        presenter.password = userPassword.text
        presenter.submitButtonClicked()
    }
}

// MARK: - PresenterView
extension LoginViewControllerMVP : PresenterView {
    
    func updateLogin() {
        let alertController = UIAlertController(title: Constants.loginSuccess, message:Constants.emailandpasswordCorrect, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.dismiss, style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func wrongLogin() {
        let alertController = UIAlertController(title: Constants.loginSuccess, message:Constants.emailandpasswordIncorrect, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.dismiss, style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
