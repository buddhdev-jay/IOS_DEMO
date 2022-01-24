//
//  LoginViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 22/03/22.
//

import UIKit

struct User : Codable {
    let email: String
    let password: String
    
}

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var passwordTxtFiled: UITextField!
    @IBOutlet weak var emailTxtFiled: UITextField!
    
    // MARK: - Variables
    var coordinator : MainVCCoordinator?
    
    // MARK: - LifeCycle Activity
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getData(){
        if let url = URL(string: Constants.BASE_URL){
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with:urlRequest){
                (data,urlResponse,error) in
                guard let responsData = data else{
                    return
                }
                debugPrint("data:\(responsData)")
                
                if let urlResponse = urlResponse {
                    debugPrint("urlResponse\(urlResponse)")
                }
                
                if let error = error {
                    debugPrint("error\(error)")
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: responsData, options: [])
                    debugPrint("json:\(json)")
                } catch let error{
                    debugPrint("error")
                }
            }
        }
        
    }
    
}

// MARK: - Outlet Actions
extension LoginViewController {
    
    @IBAction func onClickLogin(_ sender: UIButton) {
        guard let url = URL(string: Constants.loginApi) else {
            print(Constants.cannotCreateUrl)
            return
        }
        let data = User(email: emailTxtFiled.text ?? Constants.loginEmail,password: passwordTxtFiled.text ?? Constants.loginPassword)
        guard let jsonData = try? JSONEncoder().encode(data) else {
            print(Constants.errorModeltoJson)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = Constants.httpMethodPost
        request.setValue(Constants.applicationJson, forHTTPHeaderField: Constants.contenttype)
        request.setValue(Constants.applicationJson, forHTTPHeaderField: Constants.accept)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with:request){data,response,error in
            guard error == nil else {
                print(Constants.errorCallingPost)
                print(error!)
                return
            }
            guard let data = data else {
                print(Constants.errorinData)
                return
            }
            
            do {
                print(data)
            } catch {
                print(Constants.errorTryingtoConvertJsontoString)
                return
            }
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == Constants.twoHundred {
                    DispatchQueue.main.async {[weak self] in
                        guard let uSelf = self else {return}
                        uSelf.coordinator?.goToMainStoryboard()
                    }
                }
            }
        }.resume()
    }
}
