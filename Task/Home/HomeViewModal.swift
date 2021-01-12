//
//  HomeViewModal.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class HomeViewModal: NSObject {
    var items = [HomeViewModalItem]()
    weak var moveDelegate: MoveController?
    func setData() {
        let modal = HomeModal()
        let cuisineItem = HomeViewModalCuisineItem(cuisines: modal.cuisines)
        self.items.append(cuisineItem)
        let dishItem = HomeViewModalDishItem(dishes: modal.dishes)
        self.items.append(dishItem)
        let cartItem = CartItem()
        self.items.append(cartItem)
    }
}


extension HomeViewModal: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].tableRowCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .cuisine:
             if let item = item as? HomeViewModalCuisineItem, let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell{
                cell.cuisines = item.cuisines
                cell.selectionStyle = .none
                cell.delegate = self
                return cell
             }
        case .dishes:
            if let item = item as? HomeViewModalDishItem, let cell =
            tableView.dequeueReusableCell(withIdentifier: DishTableViewCell.identifier) as? DishTableViewCell{
                cell.dishes = item.dishes
                cell.selectionStyle = .none
                return cell
             }
        case .cart:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "default")
            cell.textLabel?.text = "cartKey".localized
            cell.textLabel?.textColor = UIColor.systemBlue
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if items[indexPath.section].type == .cart{
            return 60
        }else{
            return AppSizes.SCREENWIDTH / 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch items[section].type {
        case .cuisine:
            return "Cuisines".localized
        case .dishes:
            return "Dishes".localized
        default:
            return nil
        }
    }
}

enum HomeType {
    case cuisine
    case dishes
    case cart
}

struct HomeViewModalCuisineItem: HomeViewModalItem {
    var type: HomeType {
        return .cuisine
    }
    
    var tableRowCount: Int {
        return 1
    }
    
    var collectionRowCount: Int {
        return cuisines.count
    }
    
    var cuisines: [CuisineSet]
    
    init(cuisines: [CuisineSet] ) {
        self.cuisines = cuisines
    }
}

struct HomeViewModalDishItem: HomeViewModalItem {
    var type: HomeType {
        return .dishes
    }
    
    var tableRowCount: Int {
        return 1
    }
    
    var collectionRowCount: Int {
        return dishes.count
    }
    
    var dishes: [DishSet]
    
    init(dishes: [DishSet] ) {
        self.dishes = dishes
    }
}

struct CartItem:HomeViewModalItem {
    var type:HomeType{
        return .cart
    }
    
    var tableRowCount: Int {
        return 1
    }
    
    var collectionRowCount: Int {
        return 0
    }
    
    let name = "cartKey".localized
}


protocol HomeViewModalItem {
    var type: HomeType { get }
    var tableRowCount: Int { get }
    var collectionRowCount: Int { get }
}

extension HomeViewModal: MoveController {
    func moveController(dict: [String: Any], controller: AllControllers, object: Any?) {
        moveDelegate?.moveController(dict: dict, controller: controller, object: object)
    }
}
