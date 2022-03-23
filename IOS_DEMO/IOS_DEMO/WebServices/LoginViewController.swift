//
//  LoginViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 22/03/22.
//

import UIKit

class LoginViewController: UIViewController {

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
