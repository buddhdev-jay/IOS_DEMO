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
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtJobFiled: UITextField!
    @IBOutlet weak var txtNameFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onClickSubmit(_ sender: UIButton) {
        var userObject = UserJobData(name: txtNameFiled.text, job: txtJobFiled.text)
        
        
        AF.request("https://reqres.in/api/users", method: .post, parameters: userObject.requestParams(), encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }
}


