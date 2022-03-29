//
//  SecondViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 27/01/22.
//

import UIKit

protocol TextDelegate : AnyObject{
    func sendText(text : String)
}
class SecondViewController: UIViewController {


    // MARK: - Outlet
    @IBOutlet weak var txtFlied: UITextField!
    // MARK: - variable
    weak var txtDelegate : TextDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - Outlet Action
extension SecondViewController {
    @IBAction func goToSecondViewController(_ sender: UIButton) {
        txtDelegate?.sendText(text: txtFlied.text ?? Constants.hello)
        dismiss(animated:true, completion: nil)
    }
}
