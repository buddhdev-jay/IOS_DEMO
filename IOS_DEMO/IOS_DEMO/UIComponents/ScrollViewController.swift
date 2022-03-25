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
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Outlet Action
extension ScrollViewController {
    @IBAction func goToPageView(_ sender: UIButton) {
        performSegue(withIdentifier:Constants.goToPageVC , sender: self)
    }
    @IBAction func goToWebview(_ sender: Any) {
        performSegue(withIdentifier: Constants.goToWebview, sender: self)
    }
    @IBAction func goToPageControl(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.goToPageControl, sender: self)
    }
    @IBAction func goToSegmentControl(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.goToSegmentControl, sender: self)
    }
    @IBAction func goToCollection(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.goToCollectionview, sender: self)
    }
    @IBAction func goToTableView(_ sender: UIButton) {
        if let tableViewVc = self.storyboard?.instantiateViewController(withIdentifier: Constants.tableViewVc) as? TableViewController{
        self.present(tableViewVc, animated: true, completion: nil)
        }
    }
    @IBAction func goToSignUpScreen(_ sender: UIButton) {
        if let signupScreenVc = self.storyboard?.instantiateViewController(withIdentifier: Constants.signupScreenVc) as? Signup_Screen_ViewController {
        self.present(signupScreenVc, animated: true, completion: nil)
        }
    }
}
