//
//  MainVCCoordinator.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 15/03/22.
//

import UIKit

class MainVCCoordinator: Coordinator{
    // MARK: - Variables
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController){
        navController = navigationController
    }
    
    func start() {
        if let mainVC = UIStoryboard(name:Constants.MainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.Mainvc) as? ViewController{
            navController?.pushViewController(mainVC, animated: true)
        }
    }
    
    func finish() {
        //To be Implemented LATER
    }
    
    func finishtoRoot() {
        //To be Implemented LATER
    }
}
