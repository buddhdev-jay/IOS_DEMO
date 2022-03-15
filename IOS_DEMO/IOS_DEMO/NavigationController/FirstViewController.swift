//
//  FirstViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/03/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var TxtField: UITextField!
    var SignoutBtn = UIBarButtonItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "First VC"
        self.navigationController?.navigationBar.barTintColor = .blue
        SignoutBtn = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(back))
        self.navigationItem.rightBarButtonItem = SignoutBtn
    }
}

// MARK: - TxtDelegate
extension FirstViewController: TxtDelegate {
    func sendText(text : String) {
        self.navigationItem.title = text
    }
}

// MARK: - Outlet Actions
extension FirstViewController{
    @IBAction func onClickofSecondVCbtn(_ sender: UIButton) {
        if let secondvc = self.storyboard?.instantiateViewController(withIdentifier:Constants.secondVc ) as? SecondVC {
            secondvc.txtDelegate = self
            secondvc.Data = TxtField?.text ?? Constants.hello
            self.navigationController?.pushViewController(secondvc, animated: true)
            
        }
    }
    @IBAction func goToROOTVC(segue: UIStoryboardSegue){
        
    }
}

// MARK: - objectFunction Back
extension FirstViewController {
    @objc func back(sender: UIBarButtonItem){
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") {
            vc.modalPresentationStyle = .popover
            if let popOver = vc.popoverPresentationController {
                let popover: UIPopoverPresentationController = popOver
                popover.barButtonItem = SignoutBtn
                present(vc, animated: true, completion:nil)
            }
            
        }
    }
}
