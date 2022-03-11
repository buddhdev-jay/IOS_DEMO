//
//  SecondViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/03/22.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second VC"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    
    }
    
    @IBAction func onClickofThirdvc(_ sender: UIButton) {
        if let thirdvc = self.storyboard?.instantiateViewController(withIdentifier:Constants.ThirdVc ) as?  ThirdViewController {
            self.navigationController?.pushViewController(thirdvc, animated: true)
            
        }
    }
    

}
