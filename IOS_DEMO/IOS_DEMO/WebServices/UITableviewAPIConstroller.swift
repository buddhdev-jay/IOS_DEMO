//
//  UITableviewAPIConstroller.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 25/03/22.
//

import UIKit
import Alamofire

class UITableviewAPIConstroller: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    
    // MARK: - Variables
    private var peopleArray = [UserData]()
    var coordinator : ScrollVCCoordinator?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingButton.layer.masksToBounds = true
        floatingButton.layer.cornerRadius = floatingButton.frame.height / 2
        getData()
    }

    func getData() {
        if let url = URL(string: Constants.collectionviewApiLink){
            AF.request(url,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil,interceptor: nil,requestModifier: nil).response{ (response) in
                switch response.result{
                case .success(let data):
                    guard let responseData = data else {
                        return
                    }
                    do {
                        guard let people = try? JSONDecoder().decode(UsersList.self, from :responseData) else {
                            print(Constants.errorinData)
                            return
                        }
                        self.peopleArray = people.data
                        DispatchQueue.main.async { [weak self] in
                            guard let uSelf = self else {return}
                            uSelf.tableView.reloadData()
                        }
                    } catch let error {
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

// MARK: - UITableViewDelegate
extension UITableviewAPIConstroller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        coordinator?.goToSingleUser(index: peopleArray[indexPath.row].id)
    }
    
}

// MARK: - UITableViewDataSource
extension UITableviewAPIConstroller: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.apiTableviewCell) as? ApiTableViewCell  else { return UITableViewCell()}
        let people = peopleArray[indexPath.row]
        cell.configCell(firstName: people.firstName, lastName: people.lastName, email: people.email, image: people.avatar)
        return cell
    }
}

// MARK: - Outlet Actions
extension UITableviewAPIConstroller {
    
    @IBAction func onClickFloatingActionbtn(_ sender: UIButton) {
        coordinator?.goToCreateUser()
    }
}
