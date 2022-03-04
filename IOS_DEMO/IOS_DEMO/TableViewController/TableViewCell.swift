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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
