//
//  AppCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class AppCoordinator : Coordinator {
    var navController: UINavigationController?
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
   
    func start() {
        if let navController = navController {
            let mainVc = MainVCCoordinator(navController)
            mainVc.start()
        }
    }
    
    func finish() {
        
    }
    
    func finishtoRoot() {
        
    }
    
    
}
