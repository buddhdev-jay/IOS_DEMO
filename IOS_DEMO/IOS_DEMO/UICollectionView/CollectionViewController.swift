//
//  CollectionViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 04/03/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
    
}
extension CollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as?  CollectionViewCell {
            cell.lblCollectionCell.text = "\(indexPath.row)"
            return cell
        }
        return UICollectionViewCell()
    }
}
