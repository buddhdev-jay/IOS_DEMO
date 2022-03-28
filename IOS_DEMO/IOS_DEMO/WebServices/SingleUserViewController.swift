//
//  SingleUserViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 28/03/22.
//

import UIKit
import Alamofire

class SingleUserViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var emailSingleUser: UILabel!
    @IBOutlet weak var lastNameSingleUser: UILabel!
    @IBOutlet weak var firstNameSingleUser: UILabel!
    @IBOutlet weak var imgSingleUser: UIImageView!
    
    // MARK: - Variables
    var itemIndex :Int?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSingleUserData(itemIndex: itemIndex ?? 2)
    }
    func getSingleUserData(itemIndex:Int){
        
        AF.request("https://reqres.in/api/users/\(itemIndex)", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).response{ AFdata in
            do {
                print(AFdata.data)
                guard let data = AFdata.data else {return}
                guard let receivedResponse = try? JSONDecoder().decode(SingleUserResponse.self, from: data) else { return }
                print(receivedResponse)
                if let url = URL(string: receivedResponse.data.avatar) {
                    guard let data = try? Data(contentsOf: url) else {
                        print("Error: Cannot convert ")
                        return }
                    self.imgSingleUser.image = UIImage(data: data)
                    
                }
                
                self.firstNameSingleUser.text = receivedResponse.data.first_name
                self.lastNameSingleUser.text = receivedResponse.data.last_name
                self.emailSingleUser.text = receivedResponse.data.email
                
            } catch (let error){
                print(error.localizedDescription)
                return
            }
        }
}
}
