//
//  CollectionViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 04/03/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == Constants.ZERO) ? Constants.TWENETYFIVE : Constants.FIFTY
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCell, for: indexPath) as?  CollectionViewCell {
            cell.lblCollectionCell.text = "\(indexPath.row)"
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.TWO
    }
}

// MARK: - UICollectionViewDelegate
extension CollectionViewController:UICollectionViewDelegate{
    
}
