//
//  DishCollectionViewCell.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishPrice: UILabel!
    @IBOutlet weak var dishRating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        dishImage.clipsToBounds = true
        dishImage.layer.cornerRadius = 40
        dishImage.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        dishImage.layer.borderWidth = 1
        dishPrice.textColor = UIColor.black
        dishRating.textColor = UIColor.blue
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
    
    var dishItem: DishSet! {
        didSet {
            self.dishImage.setImage(imageUrl: dishItem.imagepath!)
            self.dishPrice.text = "\(dishItem.price!)"
            self.dishRating.text = "\(dishItem.rating!)"
        }
    }

}
