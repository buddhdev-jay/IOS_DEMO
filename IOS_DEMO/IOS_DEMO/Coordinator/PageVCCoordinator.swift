//
//  PageVCCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class PageVCCoordinator : Coordinator{
    
    // MARK: - Variables
    var navController: UINavigationController?
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    
    func start() {
        if let pageviewVC = UIStoryboard(name: Constants.UiStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.pageViewvc) as? PageViewController{
            navController?.pushViewController(pageviewVC, animated: true)
        }
    }
    
    func finish() {
        //To be Implemented LATER
    }
    
    func finishtoRoot() {
        //To be Implemented LATER
    }
}
