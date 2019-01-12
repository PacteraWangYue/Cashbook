//
//  EverydayBillListModel.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import Foundation
import UIKit
class EverydayBillListModel: NSObject {
    var title:String?
    var color:UIColor?
    var comment:String?
    var money:Double?
    static func getEverydayBillListModel()->[EverydayBillListModel]{
        var models = [EverydayBillListModel]()
        for i in 0..<10{
            let model = EverydayBillListModel()
            model.title = "下午:\(i):\(i)"
            model.color = UIColor.randomColor
            if i%2 == 5{
                model.comment = "\(i)fjakldskfjnkjsadlkfjlkgjasdk.fnkjaesjfjkasdjfnkjasdlfjnbajsdkljfnbksdajnfkls.adjfkasdnfkas.ndfksadmfvjdn fnm;lwknebgksdalfn gvfkdlsafn ds"
            }
            else{
                model.comment = "\(i)"
            }
            model.money = Double(i)
            models.append(model)
        }
        return models
    }
}
class EverydayBillListCellModel:NSObject{
    var time:String?
    var income:String?
    var expend:String?
    var data:[EverydayBillListModel]?
    
    static func getEverydayBillListCellModel()->[EverydayBillListCellModel]{
        var models = [EverydayBillListCellModel]()
        for i in 0..<3{
            let model = EverydayBillListCellModel()
            model.time = "1月\(i)日"
            model.income = "\(i)00000"
            model.expend = "\(i)00000"
            model.data = EverydayBillListModel.getEverydayBillListModel()
            models.append(model)
        }
        return models
    }
}
