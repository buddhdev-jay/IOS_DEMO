//
//  UITableviewAPIConstroller.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 25/03/22.
//

import UIKit
import Alamofire

struct PersonList: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [PersonData]
    let support: SupportData
}

struct PersonData: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

struct SupportData: Codable {
    let url: String
    let text: String
}

class UITableviewAPIConstroller: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private var peopleArray = [PersonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
         getData()
        
    }
        func getData()
    {
        if let url = URL(string: "https://reqres.in/api/users?page=2"){
            AF.request(url,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil,interceptor: nil,requestModifier: nil).response{ (response) in
                switch response.result {
                case .success(let data):
                    guard let responseData = data else {
                        return
                    }
                
                do {
                    
                    guard let people = try? JSONDecoder().decode(PersonList.self, from :responseData) else{
                        print("Error in data")
                        return
                    }
                    self.peopleArray = people.data
                    DispatchQueue.main.async {[weak self] in
                        guard let uSelf = self else {return}
                        uSelf.tableView.reloadData()
                    }
                }catch let error {
                    debugPrint("error\(error.localizedDescription)")
                }
                case .failure(let error):
                    print("Error:\(error.localizedDescription)")
                    break
                    
            }
            }
        }
    }
}

extension UITableviewAPIConstroller:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("you tapped")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
extension UITableviewAPIConstroller:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ApiTableViewCell") as? ApiTableViewCell  else { return UITableViewCell()}
            let people = peopleArray[indexPath.row]
            cell.emailTxtView.text = people.email
            cell.firstNametxtView.text = people.first_name
            cell.lastNameTxtview.text = people.last_name
            return cell

    }
}
 
