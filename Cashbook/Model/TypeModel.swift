//
//  TypeModel.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/6.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit
//class IncomeTypeModel: BaseModel {
//    var title:String?
//    var comment:String?
//    var color:UIColor?
//}
//class ExpendTypeModel: BaseModel {
//    var title:String?
//    var comment:String?
//    var color:UIColor?
//}
class TypeModel: NSObject {
    var title:String?
    var comment:String?
    var color:UIColor?

    
    static func getTypeModels()->[TypeModel]{
        var typemodels = [TypeModel]()
        for i in 0..<10{
            let model = TypeModel()
            model.color = UIColor.randomColor
            model.title = "\(i)"
            model.comment = "\(i)"
            typemodels.append(model)
        }
        return typemodels
    }
    static func getTypeModels2()->[TypeModel]{
        var typemodels = [TypeModel]()
        for i in 0..<10{
            let model = TypeModel()
            model.color = UIColor.randomColor
            model.title = "\(i)"
            model.comment = "\(i)"
            typemodels.append(model)
        }
        return typemodels
    }
}
class TypeModels: NSObject {
    var tableData:[TypeModel]?
    var title:String?
    static func getTypeModels()->[TypeModels]{
        var models = [TypeModels]()
        for i in 0..<2{
            let model = TypeModels()
            model.title = "\(i)"
            model.tableData = TypeModel.getTypeModels()
            models.append(model)
        }
        return models
    }
}

class testModel:BaseModel{
    var array:Any?
    var title:String?
}
