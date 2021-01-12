//
//  HomeViewController.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let homeViewModalObject = HomeViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        homeViewModalObject.moveDelegate = self
        tableView.separatorStyle = .none
        self.registerNib()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.setTableViewData()
       
    }
    @IBAction func langaugeChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            UserDefaults.standard.set("en", forKey: AppLanguageKey)
        }else{
            UserDefaults.standard.set("hi", forKey: AppLanguageKey)
        }
        
        self.tableView.reloadData()
    }
    
    func registerNib() {
        tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.register(DishTableViewCell.nib, forCellReuseIdentifier: DishTableViewCell.identifier)
        
    }
    
    
    func setTableViewData() {
        homeViewModalObject.setData()
        tableView.dataSource =  homeViewModalObject
        tableView.delegate =  homeViewModalObject
    }
}

extension HomeViewController:MoveController{
    func moveController(dict: [String : Any], controller: AllControllers, object: Any?) {
        self.navigationController?.navigationBar.isHidden = false
        switch controller {
        case .dishController:
            if let nextController = UIStoryboard.loadDishesViewController() {
                if let dishes = object as? [DishSet]{
                    nextController.dishes = dishes
                }
                self.navigationController?.pushViewController(nextController, animated: true)
            }
        case .cartController:
            if let nextController = UIStoryboard.loadCartViewController() {
                self.navigationController?.pushViewController(nextController, animated: true)
            }
        default:
            break
        }
    }
}
