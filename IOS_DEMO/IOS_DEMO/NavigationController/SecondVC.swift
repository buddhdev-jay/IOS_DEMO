//
//  SecondViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/03/22.
//

import UIKit

protocol TxtDelegate : AnyObject{
    func sendText(text : String)
}
class SecondVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var txtFlied: UITextField!
    var Data = ""
    weak var txtDelegate : TxtDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = Data
        self.navigationItem.title = Data
        //self.navigationController?.title = Data
        // self.title = "Second VC"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
    }
    
}

// MARK: - Outlet Action
extension SecondVC {
    @IBAction func goBack(_ sender: UIButton) {
        txtDelegate?.sendText(text: txtFlied.text ?? Constants.hello)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickofThirdvc(_ sender: UIButton) {
        if let thirdvc = self.storyboard?.instantiateViewController(withIdentifier:Constants.ThirdVc ) as?  ThirdViewController {
            self.navigationController?.pushViewController(thirdvc, animated: true)
        }
    }
}
