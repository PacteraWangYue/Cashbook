//
//  MonthBillListModel.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/10.
//  Copyright © 2019 王越. All rights reserved.
//

import Foundation
import UIKit

class MonthBillListModel: NSObject {
    var title:String?
    var datas:[MonthBillListCellModel]?
    static func getMonthBillListModels()->[MonthBillListModel]{
        var models = [MonthBillListModel]()
        for i in 0..<10{
            let model = MonthBillListModel()
            model.title = "\(i)"
            model.datas = MonthBillListCellModel.getMonthBillListCellModels()
            models.append(model)
        }
        return models
    }
}
class MonthBillListCellModel:NSObject{
    var color:UIColor?
    var title:String?
    var price:Int?
    static func getMonthBillListCellModels()->[MonthBillListCellModel]{
        var models = [MonthBillListCellModel]()
        for i in 0..<10{
            let model = MonthBillListCellModel()
            model.color = UIColor.randomColor
            model.title = "\(i)"
            model.price = i
            models.append(model)
        }
        return models
    }
}
