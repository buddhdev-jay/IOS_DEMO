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
    @IBAction func onImagePickerClick(_ sender: Any) {
        if let imagepickervc = self.storyboard?.instantiateViewController(withIdentifier: "imagePickerViewController") as? imagePickerViewController {
            self.navigationController?.pushViewController(imagepickervc, animated: true)
        }
    
    }
    @IBAction func goToPageView(_ sender: UIButton) {
        if let pageViewvc = self.storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController {
            self.navigationController?.pushViewController(pageViewvc, animated: true)
        }
    }
    @IBAction func goToWebview(_ sender: Any) {
        if let Webviewvc = self.storyboard?.instantiateViewController(withIdentifier: "webviewViewController") as? WebviewViewController {
            self.navigationController?.pushViewController(Webviewvc, animated: true)
        }
      
    }
    @IBAction func goToPageControl(_ sender: UIButton) {
        if let pagecontrolvc = self.storyboard?.instantiateViewController(withIdentifier: "pageControlViewController") as? PageControlViewController {
            self.navigationController?.pushViewController(pagecontrolvc, animated: true)
        }
    }
    @IBAction func goToSegmentControl(_ sender: UIButton) {
       
        if let uisegmentedvc = self.storyboard?.instantiateViewController(withIdentifier: "uISegmentedViewController") as? UISegmentedViewController {
            self.navigationController?.pushViewController(uisegmentedvc, animated: true)
        }
       
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
