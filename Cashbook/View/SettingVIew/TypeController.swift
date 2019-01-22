//
//  TypeContoller.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/16.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class TypeController: UIViewController {

//    var models:[TypeModels]?{
//        didSet{
//            var titles = [String]()
//            var tableviews = [[TypeModel]]()
//            for model in models!{
//                titles.append(model.title!)
//                tableviews.append(model.tableData!)
//            }
//            self.topView.models = titles
//            self.bottomView.data = tableviews
//        }
//    }
    var models:[TypeModel]?{
        didSet{
            var titles = [String]()
            var tableviews = [[TypeCellModel]]()
            for model in models!{
                titles.append(model.title!)
                var typetableviewmodel = [TypeCellModel]()
                for i in 0..<(model.array?.count)!{
                    let res = model.array![i]
                    let typecellmodel = TypeCellModel.init(dict: res)
                    typetableviewmodel.append(typecellmodel)
                }
                tableviews.append(typetableviewmodel)
            }
            self.topView.models = titles
            self.bottomView.data = tableviews
        }
    }
    
    lazy var rightItem:UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(clickItem))
        return item
    }()
    
    lazy var bottomView:BottomScrollView = {
        let bottomview = BottomScrollView()
        bottomview.returnPage = {
            (changePage) in
            self.topView.currentNum = Int(changePage)
        }
        bottomview.returnRes = {
            (dic, num) in
            
//            var dic = [Dictionary<String,Any>]()
//            for i in models!{
//                let res = TypeModel.reflectToDict(model: i)
//                dic.append(res)
//            }
//            print(dic)
//            dic[0].updateValue(["1":"2"], forKey: "array")
//            //            dic[0]["array"] =
//            print(dic)
//            print(dic[0]["array"])
            var str = ""
            switch num{
            case 0:str = "income"
            case 1:str = "expend"
            default :str = ""
            }
            var incomeDic = UserDefaults.standard.dictionary(forKey: str)
            incomeDic?.updateValue(dic, forKey: "array")
            UserDefaults.standard.set(incomeDic, forKey: str)
        }
        return bottomview
    }()
    
    lazy var topView:TopScrollView = {
        let view = TopScrollView()
        view.returnCount = {
            (count) in
            print(count)
            self.bottomView.currentNum = count
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.setRightBarButton(rightItem, animated: true)
        self.view.addSubview(bottomView)
        self.view.addSubview(topView)
        
        let incomeDic = UserDefaults.standard.dictionary(forKey: "income")
        let expendDic = UserDefaults.standard.dictionary(forKey: "expend")
        let incomeModel = TypeModel.init(dict: incomeDic!)
        let expendModel = TypeModel.init(dict: expendDic!)
        models = [incomeModel,expendModel]
        topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.01) {
            self.bottomView.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - 49 - self.topView.frame.height)
        }
    }
}
extension TypeController{
    @objc func clickItem(){
        print("clickItem")
    }
}
