//
//  LoginViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import UIKit

class LoginViewControllerMVP: UIViewController {
    
    //Mark : - Outlets
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    // MARK: - Variables
    lazy var presenter = LoginPresenter(view:self)
    var coordinator : MVPCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

//Mark : - PresenterView
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

//Mark : - IBActions
extension LoginViewControllerMVP {
    @IBAction func clickedSubmitBtn(_ sender: Any) {
        presenter.userName = userEmail.text
        presenter.password = userPassword.text
        presenter.submitButtonClicked()
    }
    @IBAction func onClickSignup(_ sender: UIButton) {
        coordinator?.gotoSignupPage()
    }
}
