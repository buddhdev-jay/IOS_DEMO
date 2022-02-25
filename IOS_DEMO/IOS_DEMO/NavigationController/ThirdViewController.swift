//
//  ThirdViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/03/22.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Third VC"
        // Do any additional setup after loading the view.
    }
    
    
}

// MARK: - Outlet Action
extension ThirdViewController{
    @IBAction func onClickbackVc(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
