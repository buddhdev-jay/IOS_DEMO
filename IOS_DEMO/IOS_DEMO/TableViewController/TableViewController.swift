//
//  TableViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 03/03/22.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    var names = ["JAY","abc","xyz"]
    var sectionOne = Constants.TWO
    var sectionTwo = Constants.ONE
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        for _ in 1...100 {
            names += ["JAY","abc","xyz"]
        }
        self.activityindicator.startAnimating()
        sectionOne = Constants.FIFTY
        sectionTwo = Constants.TWENETYFIVE
        self.tableView.reloadData()
        refreshControl.endRefreshing()
        self.activityindicator.stopAnimating()
    }
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: Constants.Tableviewcell, bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource =  self
        self.tableView.addSubview(self.refreshControl)
        
    }
}
// MARK: - UITableViewDelegate
extension TableViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("you tapped")
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
        }else{
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
