//
//  ApiTableViewCell.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 25/03/22.
//

import UIKit

class ApiTableViewCell: UITableViewCell {

    @IBOutlet weak var emailTxtView: UITextField!
    @IBOutlet weak var lastNameTxtview: UITextField!
    @IBOutlet weak var firstNametxtView: UITextField!
    @IBOutlet weak var imageTableview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
