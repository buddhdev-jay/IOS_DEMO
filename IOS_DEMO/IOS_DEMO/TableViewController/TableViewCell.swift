//
//  TableViewCell.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 03/03/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableCelllbl: UILabel!
    @IBOutlet weak var tableCellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: - TableViewCell
extension TableViewCell {
    
    func configCell(name :String,indexPath: IndexPath){
            tableCelllbl.text = name
            tableCellImage.image = UIImage(named: "img_google")
            tableCelllbl.textColor = .white
            backgroundColor = (indexPath.row % Constants.TWO == Constants.ZERO) ? .gray : .blue
    }
}
