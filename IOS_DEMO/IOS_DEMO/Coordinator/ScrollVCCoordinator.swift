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
}
