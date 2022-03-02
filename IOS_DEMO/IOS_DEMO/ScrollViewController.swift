//
//  ScrollViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 02/03/22.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var btnSignupScreen: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToSignupScreen(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signup_Screen_ViewController") as! Signup_Screen_ViewController
        self.present(vc, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
