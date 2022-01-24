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
        coordinator?.goToimagePicker()
    }
    
    @IBAction func goToPageView(_ sender: UIButton) {
        coordinator?.goToPageView()
    }
    
    @IBAction func goToWebview(_ sender: Any) {
        coordinator?.goToWebview()
    }
    
    @IBAction func goToPageControl(_ sender: UIButton) {
        coordinator?.goToPageControl()
    }
    
    @IBAction func goToSegmentControl(_ sender: UIButton) {
        coordinator?.goToSegmentControl()
        
    }
    
    @IBAction func goToCollection(_ sender: UIButton) {
        coordinator?.goToCollection()
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        coordinator?.goToTableView()
    }
    
    @IBAction func goToSignUpScreen(_ sender: UIButton) {
        coordinator?.goToSignUpScreen()
    }
    
    @IBAction func onClickListUserTableview(_ sender: UIButton) {
        coordinator?.goToListUserTableView()
        
    }
    
    @IBAction func onClickListUser(_ sender: UIButton) {
        coordinator?.goToListUserCollectionview()
    }
}
