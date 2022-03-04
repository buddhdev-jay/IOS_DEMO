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
   
    
    @IBAction func goToUIStoryboard(_ sender: Any) {
        performSegue(withIdentifier: "uistoryboard", sender: self)
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! SecondViewController
        vc.txtDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func goToAutoLayout(_ sender: UIButton) {
        let LoginSignupVc = self.storyboard?.instantiateViewController(withIdentifier: "login_signup_ViewController") as! Login_signup_ViewController
        self.present(LoginSignupVc, animated: true, completion: nil)
    }
 
    
}

