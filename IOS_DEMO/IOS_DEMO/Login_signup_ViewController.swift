//
//  Login_signup_ViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 25/02/22.
//

import UIKit

class Login_signup_ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var btn_signup: UIButton!

    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
   
// MARK: - Outlet Action
extension Login_signup_ViewController {
    @IBAction func goToSignupScreen(_ sender: UIButton) {
        if let signupFormVc = self.storyboard?.instantiateViewController(withIdentifier:Constants.signupFormVc ) as? Signup_form_ViewController { self.present(signupFormVc, animated: true, completion: nil)
        }
    }
}
