//
//  BudgetListController.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/15.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class BudgetListController: UIViewController {
    
    let topView = MonthBillTopView()
    let opts = UIView.AnimationOptions.curveEaseIn
    
    var res = true
    
    lazy var button :UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        btn.setTitle("111", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.randomColor
        return btn
    }()
    
    lazy var budgetTableview:BudgetTableView = {
        let tableview = BudgetTableView()
        tableview.data = BudgetModel.getBudgetModels()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(topView)
        self.view.addSubview(budgetTableview)
        let titleView : UIView = UIView(frame:CGRect(x:0,y:0,width:180,height:30))
        titleView.addSubview(button)
        self.navigationItem.titleView = titleView
        budgetTableview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.height)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            self.topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130)
            self.budgetTableview.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - self.topView.frame.height - 49)
        }
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 0, y: 0, width: 180, height: 30)
    }
    
    
    func HideView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.topView.frame = CGRect(x: 0, y: -130, width: self.view.frame.width, height: 130)
            self.budgetTableview.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.bounds.height - 49)
        }, completion: nil)
    }
    func ShowView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130)
            self.budgetTableview.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - self.topView.frame.height - 49)
        }, completion: nil)
    }
    
}
extension BudgetListController{
    @objc func buttonClick(){
        if res{
            HideView()
            res = false
        }
        else{
            ShowView()
            res = true
        }
        print("click")
    }
}
