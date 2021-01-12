//
//  CuisineCollectionViewCell.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit
import Kingfisher

class CuisineCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    weak var delegate: MoveController?
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.backgroundColor = UIColor.lightGray
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = CGFloat(5)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
    
    var cuisineItem: CuisineSet? {
        didSet {
            if URL(string: (cuisineItem?.imagepath)!) != nil {
                let resource = ImageResource(downloadURL: URL(string: (cuisineItem?.imagepath)!)!, cacheKey: cuisineItem?.imagepath!)

                imageView.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
            } else {
                imageView.image = #imageLiteral(resourceName: "placeholder")
            }
            name.text = cuisineItem?.name
        }
    }

}
