//
//  AllController.swift
//  Task
//
//  Created by Arpit Garg on 13/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import Foundation
import UIKit

enum AllControllers: String {
    case homeController = "HomeViewController"
    case dishController = "DishesViewController"
    case cartController = "CartViewController"
}

private enum Storyboard: String {
    case main = "Main"
}

fileprivate extension UIStoryboard {

    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

extension UIStoryboard {
// Main Storyboards
    class func loadDishesViewController() -> DishesViewController? {
        return loadFromMain(AllControllers.dishController.rawValue) as? DishesViewController

    }

    class func loadCartViewController() -> CartViewController? {
        return loadFromMain(AllControllers.cartController.rawValue) as? CartViewController
        
    }
}
