//
//  MenuViewController.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/8.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class MenuViewController: BaseTabBarViewController {
    
    let newExpenditure = AddNewExpenditure()
//    let data:[TypeModel] = {
//        var models = [TypeModel]()
//        let incomeDic = UserDefaults.standard.dictionary(forKey: "income")
//        let expendDic = UserDefaults.standard.dictionary(forKey: "expend")
//        models = [TypeModel.init(dict: incomeDic!),TypeModel.init(dict: expendDic!)]
//        return models
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        newExpenditure.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
    override func didChooseItem(itemIndex: Int) {
        
        if itemIndex == 2 {
            newExpenditure.isHidden = true
            newExpenditure.HideView()
            newExpenditure.isHidden = false
            newExpenditure.ShowView()
            self.view.addSubview(newExpenditure)
            var defaultModels = [TypeModel]()
            let incomeDic = UserDefaults.standard.dictionary(forKey: "income")
            let expendDic = UserDefaults.standard.dictionary(forKey: "expend")
            defaultModels = [TypeModel.init(dict: incomeDic!),TypeModel.init(dict: expendDic!)]
            let expenditureModels = newExpenditure.bottomView.TopView.data
            if expenditureModels == nil || defaultModels != expenditureModels {
                newExpenditure.bottomView.TopView.data = defaultModels
            }
        }
        else{
            self.selectedIndex = itemIndex
        }
    }
}
