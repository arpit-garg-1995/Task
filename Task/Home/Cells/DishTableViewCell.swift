//
//  DishTableViewCell.swift
//  Task
//
//  Created by Arpit Garg on 12/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class DishTableViewCell: UITableViewCell {

    @IBOutlet weak var dishCollectionView: UICollectionView!
    var dishes = [DishSet]()
    override func awakeFromNib() {
        super.awakeFromNib()
        dishCollectionView.showsHorizontalScrollIndicator = false
        dishCollectionView.register(DishCollectionViewCell.nib, forCellWithReuseIdentifier: DishCollectionViewCell.identifier)
          dishCollectionView.delegate = self
          dishCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension DishTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCollectionViewCell.identifier, for: indexPath as IndexPath) as? DishCollectionViewCell {
            cell.dishItem = dishes[indexPath.row]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
