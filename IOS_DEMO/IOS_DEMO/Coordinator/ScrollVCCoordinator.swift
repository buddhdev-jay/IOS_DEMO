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
        if let TableViewVc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier:Constants.tableViewVc ) as? TableViewController {
            navController?.present(TableViewVc, animated: true, completion: nil) }
    }
    
    func goToSignUpScreen(){
        if let SignupScreenVc = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier:Constants.signupScreenvctwo) as? SignupScreenViewControllertwo {
            navController?.present(SignupScreenVc, animated: true, completion: nil) }
    }
    
    func goToListUserCollectionview(){
        if let collectionViewVC = UIStoryboard(name: Constants.webServicesStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.collectionApiVc) as? CollectionApiViewController {
            navController?.pushViewController(collectionViewVC, animated: true)
        }
    }
    
    func goToListUserTableView(){
        if let tableViewVC = UIStoryboard(name: Constants.webServicesStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.tableApiVc) as? UITableviewAPIConstroller {
            tableViewVC.coordinator = self
            navController?.pushViewController(tableViewVC, animated: true)
        }
    }
    
    func goToSingleUser(index:Int){
        if let singleuserVC = UIStoryboard(name: Constants.webServicesStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.singleUserVc) as? SingleUserViewController {
            singleuserVC.itemIndex = index
            navController?.pushViewController(singleuserVC, animated: true)
        }
    }
    	
    func goToCreateUser(){
        if let addUserVC = UIStoryboard(name: Constants.webServicesStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.addUserVc) as? AddUserViewController {
            navController?.pushViewController(addUserVC, animated: true)
        }
    }
}
