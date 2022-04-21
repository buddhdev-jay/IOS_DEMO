//
//  CollectionViewApiCell.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 24/03/22.
//

import UIKit

class CollectionViewApiCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var txtEmailCollectionview: UITextField!
    @IBOutlet weak var txtLastNameCollectionview: UITextField!
    @IBOutlet weak var txtFirstNameCollectionview: UITextField!
    @IBOutlet weak var imgCollectionview: UIImageView!
    
}

extension CollectionViewApiCell {
    
    func configCell(fname :String,lname :String,email :String,image: String){
        txtEmailCollectionview.text = email
        txtLastNameCollectionview.text = lname
        txtFirstNameCollectionview.text = fname
        if let url = URL(string: image) {
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else {return}
                DispatchQueue.main.async {
                    self.imgCollectionview.image = UIImage(data: data)
                }
            }
        }
    }
    
}
