//
//  ThirdViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/03/22.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Outlet Action
extension ThirdViewController{
    @IBAction func onClickbackVc(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
