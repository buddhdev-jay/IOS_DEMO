//
//  TabBarViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 2
        self.delegate = self
    }
}
// MARK: - UITabBarControllerDelegate
extension TabBarViewController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}
