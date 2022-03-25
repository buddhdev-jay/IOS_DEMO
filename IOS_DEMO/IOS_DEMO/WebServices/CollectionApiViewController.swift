//
//  CollectionApiViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 24/03/22.
//

import UIKit


struct UsersList: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [UserData]
    let support: Support
}

struct UserData: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

struct Support: Codable {
    let url: String
    let text: String
}

class CollectionApiViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    private var peopleArray = [UserData]()
    
    // MARK: - LifeCycle Activity
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        getData()
    }
    
    func getData(){
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else {
            print("Error: cannot create URL")
            return
        }
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let datatask = session.dataTask(with: request) { data ,urlNewResponse ,error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            do {
                guard let data = data else{
                    return
                }
                let json = try JSONSerialization.jsonObject(with: data, options: [])
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
                guard let people = try? JSONDecoder().decode(UsersList.self, from :prettyJsonData) else{
                    print("Error in data")
                    return
                }
                
                self.peopleArray = people.data
                DispatchQueue.main.async {[weak self] in
                    guard let uSelf = self else {return}
                    uSelf.collectionView.reloadData()
                }
                
                debugPrint(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
        datatask.resume()
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionApiViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peopleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApiCollectionview", for: indexPath) as?  CollectionViewApiCell {
            
            let people = peopleArray[indexPath.row]
            if let url = URL(string: people.avatar ?? "") {
                            DispatchQueue.global().async {
                                let data = try? Data(contentsOf: url)
                                DispatchQueue.main.async {
                                    cell.imgCollectionview.image = UIImage(data: data!)
                                    cell.txtEmailCollectionview.text = people.email
                                    cell.txtLastNameCollectionview.text = people.last_name
                                    cell.txtFirstNameCollectionview.text = people.first_name

                                }

                            }

                        }
            return cell
        }
        return UICollectionViewCell()
    }
    
}

// MARK: - UICollectionViewDelegate
extension CollectionApiViewController : UICollectionViewDelegate{
    
}
