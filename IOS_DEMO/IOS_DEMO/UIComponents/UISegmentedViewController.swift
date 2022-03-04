//
//  UISegmentedViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 04/03/22.
//

import UIKit

class UISegmentedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func imageChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            imageView.image = UIImage(named: "img_eye_icon")
        case 1:
            imageView.image = UIImage(named: "img_google")
        default:
            imageView.image = UIImage(named: "img_google")
        }
    }
}
