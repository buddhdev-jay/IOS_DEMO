//
//  PageViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/03/22.
//

import UIKit

class PageViewController: UIPageViewController {

    // MARK: -  Variables
    lazy var vcList:[UIViewController] = {
            let storyboard = UIStoryboard(name: "UI_Component_Storyboard", bundle: nil)
        let SignupVC = storyboard.instantiateViewController(identifier: Constants.signupScreenVc)
        let tableVC = storyboard.instantiateViewController(identifier: Constants.tableViewVc)
        return [SignupVC, tableVC]
        }()
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let viewController = vcList.first {
            self.setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController:UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else { return UIViewController()}
                let previousIndex = index - Constants.ONE
                if previousIndex >= Constants.ZERO, previousIndex < vcList.count {
                        return vcList[previousIndex]
                }
                return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else { return UIViewController()}
                let previousIndex = index + Constants.ONE
                if previousIndex >= Constants.ZERO, previousIndex < vcList.count {
                        return vcList[previousIndex]
                }
                return UIViewController()
    }
}
