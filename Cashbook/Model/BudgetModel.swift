//
//  BudgetModel.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/15.
//  Copyright © 2019 王越. All rights reserved.
//

import Foundation
import UIKit

class BudgetModel: NSObject {
    var title:String?
    var color:UIColor?
    var count:CGFloat?
    var price:CGFloat?
    
    static func getBudgetModels()->[BudgetModel]{
        var models = [BudgetModel]()
        for i in 0..<2{
            let model = BudgetModel()
            model.title = "\(i)"
            model.color = UIColor.randomColor
            model.count = CGFloat(i)
            model.price = CGFloat(i)
            models.append(model)
        }
        return models
    }
}
