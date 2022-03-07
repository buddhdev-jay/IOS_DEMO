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
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: - Outlet Action
extension PageControlViewController{
    @IBAction func changePage(_ sender: UIPageControl) {
        lblPagename.text = "Page \(sender.currentPage + 1)"
        switch sender.currentPage {
        case 0:
            sender.backgroundColor = UIColor.black
        case 1:
            sender.backgroundColor = UIColor.gray
        case 2:
            sender.backgroundColor = UIColor.orange
        default:
            sender.backgroundColor = UIColor.brown
        }
    }
    
}
