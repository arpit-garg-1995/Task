//
//  DishesViewController.swift
//  Task
//
//  Created by Arpit Garg on 13/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class DishesViewController: UIViewController {

    @IBOutlet weak var tabeVIew: UITableView!
    var dishes = [DishSet]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabeVIew.register(DishCartTableViewCell.nib, forCellReuseIdentifier: DishCartTableViewCell.identifier)
        tabeVIew.delegate = self
        tabeVIew.dataSource = self
        
    }
}

extension DishesViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DishCartTableViewCell.identifier) as?
            DishCartTableViewCell{
            cell.dishItem = dishes[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }else{
            return UITableViewCell()
        }
    }
}
