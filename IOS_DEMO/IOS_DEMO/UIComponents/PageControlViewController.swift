//
//  PageControlViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/03/22.
//

import UIKit

class PageControlViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var lblPagename: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page Controller"
    }
    
}

// MARK: - Outlet Action
extension PageControlViewController {
    
    @IBAction func changePage(_ sender: UIPageControl) {
        lblPagename.text = "Page \(sender.currentPage + 1)"
        switch sender.currentPage {
        case Constants.ZERO:
            sender.backgroundColor = UIColor.black
        case Constants.ONE:
            sender.backgroundColor = UIColor.gray
        case Constants.TWO:
            sender.backgroundColor = UIColor.orange
        default:
            sender.backgroundColor = UIColor.brown
        }
    }
}
