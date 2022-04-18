//
//  ScrollVCCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class ScrollVCCoordinator : Coordinator {
    
    // MARK: - Variables
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    
    func start() {
        if let scrollVC = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.scrollVc) as? ScrollViewController{
            scrollVC.coordinator = self
            navController?.pushViewController(scrollVC, animated: true)
        }
    }
    
    func finish() {
        //To be Implemented LATER
    }
    
    func finishtoRoot() {
        //To be Implemented LATER
    }
    
    func goToPageView() {
        if let navController = navController {
            let pageVc = PageVCCoordinator(navController)
            pageVc.start()
        }
    }
    
    func goToimagePicker() {
        if let imagepickervc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier:Constants.imagepickervc ) as? imagePickerViewController {
            navController?.pushViewController(imagepickervc, animated: true)
        }
    }
    
    func goToWebview() {
        if let webviewvc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.webviewvc) as? WebviewViewController {
            navController?.pushViewController(webviewvc, animated: true)
        }
    }
    
    func goToPageControl(){
        if let pagecontrolvc =  UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.pagecontrolvc) as? PageControlViewController {
            navController?.pushViewController(pagecontrolvc, animated: true)
        }
    }
    
    func goToSegmentControl(){
        if let uisegmentedvc =  UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.uisegmentedvc) as? UISegmentedViewController {
            navController?.pushViewController(uisegmentedvc, animated: true)
        }
    }
    
    func goToCollection(){
        if let collectionvc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.collectionvc) as?  CollectionViewController {
            navController?.pushViewController(collectionvc, animated: true)
        }
    }
    
    func goToTableView(){
        let TableViewVc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier:Constants.tableViewVc ) as! TableViewController
            navController?.present(TableViewVc, animated: true, completion: nil)
    }
    
    func goToSignUpScreen(){
        let SignupScreenVc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier:Constants.signupScreenvc) as! Signup_Screen_ViewController
        navController?.present(SignupScreenVc, animated: true, completion: nil)
    }
}
