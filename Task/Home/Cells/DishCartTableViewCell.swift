//
//  DishCartTableViewCell.swift
//  Task
//
//  Created by Arpit Garg on 13/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class DishCartTableViewCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var countlabel: UILabel!
    
    var someValue: Int = 0 {
        didSet {
            countlabel.text = "\(someValue)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    @IBAction func counterChage(_ sender: UIButton) {
        if sender.tag == 1 {
            someValue += 1
            dishItem.count += 1
        }else if someValue > 0{
            someValue -= 1
            dishItem.count -= 1
        }
    }
    
    var dishItem: DishSet! {
        didSet {
            self.dishImage.setImage(imageUrl: dishItem.imagepath!)
            self.price.text = "\(dishItem.price!)"
            self.rating.text = "\(dishItem.rating!)"
        }
    }
}
