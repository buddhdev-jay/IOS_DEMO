//
//  UISegmentedViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 04/03/22.
//

import UIKit

class UISegmentedViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ui Segment Control"
    }
}

// MARK: - Outlet Action
extension UISegmentedViewController {
    
    @IBAction func imageChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case Constants.ZERO:
            imageView.image = UIImage(named: "img_eye_icon")
        case Constants.ONE:
            imageView.image = UIImage(named: "img_google")
        default:
            imageView.image = UIImage(named: "img_google")
        }
    }
}
