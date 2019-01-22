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
//class TypeModel: NSObject {
//    var title:String?
//    var comment:String?
//    var color:UIColor?
//
//
//    static func getTypeModels()->[TypeModel]{
//        var typemodels = [TypeModel]()
//        for i in 0..<10{
//            let model = TypeModel()
//            model.color = UIColor.randomColor
//            model.title = "\(i)"
//            model.comment = "\(i)"
//            typemodels.append(model)
//        }
//        return typemodels
//    }
//    static func getTypeModels2()->[TypeModel]{
//        var typemodels = [TypeModel]()
//        for i in 0..<10{
//            let model = TypeModel()
//            model.color = UIColor.randomColor
//            model.title = "\(i)"
//            model.comment = "\(i)"
//            typemodels.append(model)
//        }
//        return typemodels
//    }
//}
//class TypeModels: NSObject {
//    var tableData:[TypeModel]?
//    var title:String?
//    static func getTypeModels()->[TypeModels]{
//        var models = [TypeModels]()
//        for i in 0..<2{
//            let model = TypeModels()
//            model.title = "\(i)"
//            model.tableData = TypeModel.getTypeModels()
//            models.append(model)
//        }
//        return models
//    }
//}

class TypeModel: BaseModel{
    
    @objc var array:Array<Dictionary<String,Any>>?
    @objc var title:String?

    func getTypeCellModels()->[TypeCellModel]{
        var models = [TypeCellModel]()
        for i in 0..<self.array!.count{
            let model = TypeCellModel.init(dict: self.array![i])
            models.append(model)
        }
        return models
    }
    
    static func getTypeModels()->[TypeModel]{
        var models = [TypeModel]()
        let incomeDic = UserDefaults.standard.dictionary(forKey: "income")
        let expendDic = UserDefaults.standard.dictionary(forKey: "expend")
        models = [TypeModel.init(dict: incomeDic!),TypeModel.init(dict: expendDic!)]
        return models
    }
    
    
    static func reflectToDict<T>(model: T) -> [String:Any] {
        let mirro = Mirror(reflecting: model)
        var dict = [String:Any]()
        for case let (key?, value) in mirro.children {
            dict[key] = value
        }
        return dict
    }

    
}
class TypeCellModel:BaseModel{
    @objc var title:String?
    @objc var color:String?
    @objc var comment:String?
    
//    override init(dict: [String : Any]) {
//        super.init(dict: dict)
//        title = dict["title"] as? String
//        color = dict["color"] as? UIColor
//        comment = dict["comment"] as? String
//    }
}
