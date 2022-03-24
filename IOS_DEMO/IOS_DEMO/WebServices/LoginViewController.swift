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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getData(){
        if let url = URL(string: Constants.BASE_URL){
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with:urlRequest){
                (data,urlResponse,error) in
                guard let responsData = data else{
                    return
                }
                print("data:\(responsData)")
                
                if let urlResponse = urlResponse {
                    print("urlResponse\(urlResponse)")
                }
                
                if let error = error {
                    print("error\(error)")
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: responsData, options: [])
                    print("json:\(json)")
                }catch let error{
                    print("error")
                }
                
            }
        }
        
    }
    
}

// MARK: - Outlet Actions
extension LoginViewController {
    @IBAction func onClickLogin(_ sender: UIButton) {
        guard let url = URL(string: "https://reqres.in/api/login") else {
            print("Error: cannot create URL")
            return
        }
        let data = User(email: emailTxtFiled.text ?? "eve.holt@reqres.in",password: passwordTxtFiled.text ?? "cityslicka")
        guard let jsonData = try? JSONEncoder().encode(data) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        URLSession.shared.dataTask(with:request){data,response,error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
           
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {[weak self] in
                        guard let uSelf = self else {return}
                        uSelf.coordinator?.goToMainStoryboard()
                    }
                }else {
                    
                }
            }
        }.resume()
        
    }
}
