//
//  TableViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 03/03/22.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -  Variables
    var names = ["JAY","abc","xyz"]
    var sectionOne = Constants.TWO
    var sectionTwo = Constants.ONE
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: Constants.Tableviewcell, bundle: nil), forCellReuseIdentifier: Constants.cell)
        tableView.delegate = self
        tableView.dataSource =  self
        self.tableView.addSubview(self.refreshControl)
    }
}

// MARK: -  objc Handle Refresh
extension TableViewController{
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        for _ in 1...100 {
            names += ["JAY","abc","xyz"]
        }
        sectionOne = Constants.HUNDRED
        sectionTwo = Constants.TWENETYFIVE
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDelegate
extension TableViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        debugPrint("you tapped")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource
extension TableViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.TWO
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Constants.ZERO {
            return sectionTwo
        } else {
            return sectionOne
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell) as? TableViewCell {
            cell.configCell(name: names[indexPath.row], indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Constants.FIFTY)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer \(section)"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .cyan
        return headerView
    }
}
