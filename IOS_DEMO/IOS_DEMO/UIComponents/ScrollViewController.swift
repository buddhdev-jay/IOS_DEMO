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
    
    // MARK: - Variables
    var coordinator : ScrollVCCoordinator?
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navController = self.navigationController{
            coordinator = ScrollVCCoordinator(navController)
        }
    }
}
// MARK: - Outlet Action
extension ScrollViewController {
    
    @IBAction func onImagePickerClick(_ sender: Any) {
        if let imagepickervc = self.storyboard?.instantiateViewController(withIdentifier:Constants.imagepickervc ) as? imagePickerViewController {
            self.navigationController?.pushViewController(imagepickervc, animated: true)
        }
    }
    
    @IBAction func goToPageView(_ sender: UIButton) {
        coordinator?.goToPageView()
    }
    
    @IBAction func goToWebview(_ sender: Any) {
        if let webviewvc = self.storyboard?.instantiateViewController(withIdentifier: Constants.webviewvc) as? WebviewViewController {
            self.navigationController?.pushViewController(webviewvc, animated: true)
        }
    }
    
    @IBAction func goToPageControl(_ sender: UIButton) {
        if let pagecontrolvc = self.storyboard?.instantiateViewController(withIdentifier: Constants.pagecontrolvc) as? PageControlViewController {
            self.navigationController?.pushViewController(pagecontrolvc, animated: true)
        }
    }
    
    @IBAction func goToSegmentControl(_ sender: UIButton) {
        if let uisegmentedvc = self.storyboard?.instantiateViewController(withIdentifier: Constants.uisegmentedvc) as? UISegmentedViewController {
            self.navigationController?.pushViewController(uisegmentedvc, animated: true)
        }
    }
    
    @IBAction func goToCollection(_ sender: UIButton) {
        if let collectionvc = self.storyboard?.instantiateViewController(withIdentifier: Constants.collectionvc) as?  CollectionViewController {
            self.navigationController?.pushViewController(collectionvc, animated: true)
        }
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        let TableViewVc = self.storyboard?.instantiateViewController(withIdentifier:Constants.tableViewVc ) as! TableViewController
        self.present(TableViewVc, animated: true, completion: nil)
    }
    
    @IBAction func goToSignUpScreen(_ sender: UIButton) {
        let SignupScreenVc = self.storyboard?.instantiateViewController(withIdentifier:Constants.signupScreenvc) as! Signup_Screen_ViewController
        self.present(SignupScreenVc, animated: true, completion: nil)
    }
}
