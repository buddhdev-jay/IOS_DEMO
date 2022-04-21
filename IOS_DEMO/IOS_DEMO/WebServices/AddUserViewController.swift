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
    
}

// MARK: - Outlet Action
extension AddUserViewController {
    
    @IBAction func onClickSubmit(_ sender: UIButton) {
        var userObject = UserJobData(name: txtNameFiled.text, job: txtJobFiled.text)
        AF.request(Constants.adduserapi, method: .post, parameters: userObject.requestParams(), encoding: JSONEncoding.default, headers: nil).validate(statusCode: Constants.twoHundred ..< Constants.twoNintynine).responseJSON { AFdata in
            do {
                debugPrint(AFdata)
            } catch {
                debugPrint(Constants.errorTryingtoConvertJsontoString)
                return
            }
        }
    }
}
