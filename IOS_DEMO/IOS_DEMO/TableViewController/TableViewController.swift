//
//  TableViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 03/03/22.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let names = ["JAY","abc","xyz"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource =  self
    }
}
extension TableViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("you tapped")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  
}
extension TableViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell {
            cell.tableCelllbl?.text = names[indexPath.row]
            cell.tableCellImage?.image = UIImage(named: "img_google")
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer "
    }
    
}
