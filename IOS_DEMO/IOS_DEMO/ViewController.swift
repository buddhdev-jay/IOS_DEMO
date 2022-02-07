//
//  ViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 11/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var txtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - textDelegate Extension
extension ViewController: TextDelegate {
    func sendText(text : String) {
        txtView.text = text
    }
}

// MARK: - Outlet Action
extension ViewController {
    @IBAction func goToAnotherViewcontroller(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! SecondViewController
        vc.txtDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

