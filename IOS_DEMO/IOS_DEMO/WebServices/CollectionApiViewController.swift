//
//  CollectionApiViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 24/03/22.
//

import UIKit

class CollectionApiViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    private var peopleArray = [UserData]()
    
    // MARK: - LifeCycle Activity
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        getData()
    }
    
    func getData(){
        guard let url = URL(string:Constants.collectionviewApiLink) else {
            print(Constants.cannotCreateUrl)
            return
        }
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        var request = URLRequest(url: url)
        request.httpMethod = Constants.httpMethodGET
        let datatask = session.dataTask(with: request) { data ,urlNewResponse ,error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            do {
                guard let data = data else{
                    return
                }
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                guard let people = try? JSONDecoder().decode(UsersList.self, from: data) else{
                    print(Constants.errorinData)
                    return
                }
                self.peopleArray = people.data
                DispatchQueue.main.async {[weak self] in
                    guard let uSelf = self else {return}
                    uSelf.collectionView.reloadData()
                }
            } catch {
                print(Constants.errorTryingtoConvertJsontoString)
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.apiCollectionview, for: indexPath) as?  CollectionViewApiCell {
            let people = peopleArray[indexPath.row]
            cell.configCell(fname: people.firstName,lname: people.lastName,email: people.email,image: people.avatar)
            return cell
        }
        return UICollectionViewCell()
    }
}
