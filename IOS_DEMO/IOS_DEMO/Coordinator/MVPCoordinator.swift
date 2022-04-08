//
//  MVPCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/04/22.
//

import Foundation
import UIKit

class MVPCoordinator : Coordinator{
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    func start() {
        if let LoginmvpVC = UIStoryboard(name: "ArchitectureStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.loginmvpVc) as? LoginViewControllerMVP{
            LoginmvpVC.coordinator = self
            navController?.pushViewController(LoginmvpVC, animated: true)
        }
    }
    
    func finish() {
        
    }
    
    func finishtoRoot() {
        
    }
    func gotoSignupPage(){
        if let navController = navController {
            let mvvmVc = MVVMCoordinator(navController)
            mvvmVc.start()
        }
    }

}
