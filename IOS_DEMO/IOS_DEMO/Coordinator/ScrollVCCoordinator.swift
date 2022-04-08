//
//  ScrollVCCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class ScrollVCCoordinator : Coordinator{
    var navController: UINavigationController?
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    func start() {
        if let scrollVC = UIStoryboard(name: "UI_Component_Storyboard", bundle: nil).instantiateViewController(withIdentifier: Constants.scrollVc) as? ScrollViewController{
            navController?.pushViewController(scrollVC, animated: true)
        }
    }
    
    func finish() {
        
    }
    
    func finishtoRoot() {
        
    }
    func goToPageView(){
        if let navController = navController {
            let pageVc = PageVCCoordinator(navController)
            pageVc.start()
        }
    }
    func goToListUserCollectionview(){
        if let collectionViewVC = UIStoryboard(name: "WebServiceStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.collectionApiVc) as? CollectionApiViewController{
            navController?.pushViewController(collectionViewVC, animated: true)
    }
    }
    func goToListUserTableView(){
        if let tableViewVC = UIStoryboard(name: "WebServiceStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.tableApiVc) as? UITableviewAPIConstroller{
            tableViewVC.coordinator = self
            navController?.pushViewController(tableViewVC, animated: true)
    }
        
    }
    func goToSingleUser(index:Int){
        if let singleuserVC = UIStoryboard(name: "WebServiceStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.singleUserVc) as? SingleUserViewController{
            singleuserVC.itemIndex = index
            navController?.pushViewController(singleuserVC, animated: true)
    }
    }
    func goToCreateUser(){
        if let addUserVC = UIStoryboard(name: "WebServiceStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.addUserVc) as? AddUserViewController{
            navController?.pushViewController(addUserVC, animated: true)
    }
    }
    func goToArchitectureStoryboard(){
        if let navController = navController {
            let architectureVc = MVPCoordinator(navController)
            architectureVc.start()
        }
    }
}
