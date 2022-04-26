//
//  AppCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class AppCoordinator : Coordinator {
    
    // MARK: - Variables
    var navController: UINavigationController?

    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
   
    func start() {
        if let navController = navController {
            let scrollVc = ScrollVCCoordinator(navController)
            scrollVc.start()
        }
    }
    
    func finish() {
        //To be Implemented LATER
    }
    
    func finishtoRoot() {
       //To be Implemented LATER
    }
}

