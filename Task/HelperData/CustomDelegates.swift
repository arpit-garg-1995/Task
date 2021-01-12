//
//  CustomDelegates.swift
//  Task
//
//  Created by Arpit Garg on 13/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import Foundation

protocol MoveController: class {
    func moveController(dict: [String: Any], controller: AllControllers, object:Any?)
}
