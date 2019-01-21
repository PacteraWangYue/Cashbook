//
//  TypeContoller.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/16.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class TypeController: UIViewController {

    var models:[TypeModels]?{
        didSet{
            var titles = [String]()
            var tableviews = [[TypeModel]]()
            for model in models!{
                titles.append(model.title!)
                tableviews.append(model.tableData!)
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
        return bottomview
    }()
    
    lazy var topView:TopScrollView = {
        let view = TopScrollView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.setRightBarButton(rightItem, animated: true)
        self.view.addSubview(bottomView)
        self.view.addSubview(topView)
        
        let incomeDic = UserDefaults.standard.dictionary(forKey: "incomeDic")
        let expendDic = UserDefaults.standard.dictionary(forKey: "expendDic")
        let incomeModel = testModel.init(dict: incomeDic!)
        let expendModel = testModel.init(dict: expendDic!)
        
        models = TypeModels.getTypeModels()
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
