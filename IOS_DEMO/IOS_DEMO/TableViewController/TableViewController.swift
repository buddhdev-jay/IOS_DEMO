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
    var names = ["JAY","abc","xyz"]
    var sectionOne = 2
    var sectionTwo = 1
    
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
        sectionOne = 100
        sectionTwo = 25
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
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
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionTwo
        }else{
            return sectionOne
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell {
            cell.tableCelllbl?.text = names[indexPath.row]
            cell.tableCellImage?.image = UIImage(named: "img_google")
            if indexPath.row % 2 == 0{
                cell.backgroundColor = .gray
            }else
            {
                cell.backgroundColor = .blue
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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
