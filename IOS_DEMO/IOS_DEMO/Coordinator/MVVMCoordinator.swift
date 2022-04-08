//
//  MVVMCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/04/22.
//

import Foundation
import UIKit

class MVVMCoordinator : Coordinator{
    
    var navController: UINavigationController?
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    func start() {
        if let LoginmvpVC = UIStoryboard(name: "ArchitectureStoryboard", bundle: nil).instantiateViewController(withIdentifier: Constants.signupmvvmVc) as? SignupMVVMViewController{
            navController?.pushViewController(LoginmvpVC, animated: true)
        }
    }
    
    func finish() {
        
    }
    
    func finishtoRoot() {
        
    }
}
