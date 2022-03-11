//
//  HomeviewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 10/03/22.
//

import UIKit

class HomeviewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var switchbtn: UISwitch!
    @IBOutlet weak var stackView: UIStackView!
    // MARK: - Variables
    var names = ["JAY","abc","xyz","JAY","abc","xyz"]
    var filterdData : [String] = []
    var searching = false
    var numberofItems = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource =  self
        searchBar.delegate = self
        collectionview.dataSource = self
        collectionview.delegate = self
        self.navigationController?.title = "Home View"
        filterdData = names
        for _ in 1...100 {
            names += ["JAY","abc","xyz"]
        }
    }
}
// MARK: - Outlet Actions
extension HomeviewController{
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case Constants.ZERO:
            stepper.isHidden = true
            tableView.isHidden = false
            collectionview.isHidden = true
            stackView.isHidden = true
        case Constants.ONE:
            stepper.isHidden = false
            tableView.isHidden = true
            collectionview.isHidden = false
            stackView.isHidden = true
        case Constants.TWO:
            stepper.isHidden = true
            tableView.isHidden = true
            collectionview.isHidden = true
            stackView.isHidden = false
        default:
            break
            
        }
    }
    @IBAction func changeOrientation(_ sender: UISwitch) {
        stackView.axis = sender.isOn ? .vertical : .horizontal
    }
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        numberofItems = Int(sender.value)
        collectionview.reloadData()
    }
}
// MARK: - UITableViewDataSource
extension HomeviewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.ONE
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterdData.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = filterdData[indexPath.row]
        if indexPath.row % Constants.TWO == Constants.ZERO{
            cell.backgroundColor = .gray
        }else
        {
            cell.backgroundColor = .lightText
        }
        return cell
    }
    
}
// MARK: - UITableViewDelegate
extension HomeviewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("you tapped")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
// MARK: - UISearchBarDelegate
extension HomeviewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterdData = names
        if searchText != "" {
            filterdData = filterdData.filter{$0.lowercased().contains(searchText.lowercased())}
            tableView.reloadData()
        }else{
            tableView.reloadData()
        }
        
    }
}
// MARK: - UICollectionViewDataSource
extension HomeviewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberofItems
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath) as?  UICollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
}
// MARK: - UICollectionViewDelegate
extension HomeviewController : UICollectionViewDelegate{
    
}
