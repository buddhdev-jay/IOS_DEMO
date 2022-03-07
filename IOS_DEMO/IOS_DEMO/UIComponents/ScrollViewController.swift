//
//  ScrollViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 02/03/22.
//

import UIKit

class ScrollViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var btnTableView: UITextField!
    @IBOutlet weak var btnSignupScreen: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
// MARK: - Outlet Action
extension ScrollViewController {
    @IBAction func goToPageView(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPageviewControl", sender: self)
    }
    @IBAction func goToWebview(_ sender: Any) {
        performSegue(withIdentifier: "goToWebview", sender: self)
    }
    @IBAction func goToPageControl(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPageControl", sender: self)
    }
    @IBAction func goToSegmentControl(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSegmentControl", sender: self)
    }
    @IBAction func goToCollection(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCollectionView", sender: self)
    }
    @IBAction func goToTableView(_ sender: UIButton) {
        let TableViewVc = self.storyboard?.instantiateViewController(withIdentifier: "tableViewController") as! TableViewController
        self.present(TableViewVc, animated: true, completion: nil)
    }
    @IBAction func goToSignUpScreen(_ sender: UIButton) {
        let SignupScreenVc = self.storyboard?.instantiateViewController(withIdentifier: "signup_Screen_ViewController") as! Signup_Screen_ViewController
        self.present(SignupScreenVc, animated: true, completion: nil)
    }
}
