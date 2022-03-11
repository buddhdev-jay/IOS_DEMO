//
//  FirstViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/03/22.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First VC"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: nil)
    
    }
    

    @IBAction func onClickofSecondVCbtn(_ sender: UIButton) {
        if let secondvc = self.storyboard?.instantiateViewController(withIdentifier:Constants.secondVc ) as? SecondVC {
            self.navigationController?.present(secondvc, animated: true)
            
        }
    }
    @IBAction func goToROOTVC(segue: UIStoryboardSegue){
        
    }
}
