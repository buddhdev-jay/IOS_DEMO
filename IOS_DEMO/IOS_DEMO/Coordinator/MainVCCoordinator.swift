//
//  MainVCCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class MainVCCoordinator: Coordinator{
    var navController: UINavigationController?
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    func start() {
        if let webserviceVC = UIStoryboard(name: "WebServiceStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.loginVc) as? LoginViewController{
            webserviceVC.coordinator = self
            navController?.pushViewController(webserviceVC, animated: true)
        }
    }
    
    func finish() {
        
    }
    
    func finishtoRoot() {
        
    }
    func goToMainStoryboard(){
        if let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.vc) as? ViewController{
            navController?.pushViewController(mainVC, animated: true)
        }
    }
    
}
