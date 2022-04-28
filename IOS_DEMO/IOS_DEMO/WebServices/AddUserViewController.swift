//
//  AddUserViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 28/03/22.
//

import UIKit
import Alamofire

struct UserJobData {
    var name : String?
    var job : String?
    
    func requestParams() -> [String:Any]{
        var user : [String:Any] = [:]
        user["name"] = name
        user["job"] = job
        return user
    }
}

class AddUserViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtJobFiled: UITextField!
    @IBOutlet weak var txtNameFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        txtJobFiled.delegate = self
        txtNameFiled.delegate = self
    }
    
}

// MARK: - Outlet Action
extension AddUserViewController {
    
    @IBAction func onClickSubmit(_ sender: UIButton) {
        var userObject = UserJobData(name: txtNameFiled.text, job: txtJobFiled.text)
        AF.request(Constants.adduserapi, method: .post, parameters: userObject.requestParams(), encoding: JSONEncoding.default, headers: nil).validate(statusCode: Constants.twoHundred ..< Constants.twoNintynine).responseJSON { AFdata in
            do {
                debugPrint(AFdata)
                self.alert(customMessage: "User Added")
            } catch {
                debugPrint(Constants.errorTryingtoConvertJsontoString)
                return
            }
        }
    }
}

extension AddUserViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupFormViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: -  UITextFieldDelegate
extension AddUserViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtNameFiled :
            txtNameFiled.resignFirstResponder()
            txtJobFiled.becomeFirstResponder()
        case txtJobFiled :
            txtJobFiled.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
