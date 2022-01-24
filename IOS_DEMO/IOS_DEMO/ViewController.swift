//
//  ViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/01/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var btn_gotoautolayout: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var txtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - textDelegate Extension
extension ViewController: TextDelegate {
    func sendText(text : String) {
        txtView.text = text
    }
}

// MARK: - Outlet Action
extension ViewController {
    @IBAction func goToAnotherViewcontroller(_ sender: UIButton) {
        if let secondvc = self.storyboard?.instantiateViewController(withIdentifier:Constants.secondVC ) as? SecondViewController{
            secondvc.txtDelegate = self
            self.present(secondvc, animated: true, completion: nil)}
    }
    @IBAction func goToAutoLayout(_ sender: UIButton) {
        if let loginSignupvc = self.storyboard?.instantiateViewController(withIdentifier: Constants.loginSignupVc) as? Login_signup_ViewController {
            self.present(loginSignupvc, animated: true, completion: nil)
        }
    }
}
