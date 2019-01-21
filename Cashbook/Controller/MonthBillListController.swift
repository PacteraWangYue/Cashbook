//
//  MonthBillListController.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class MonthBillListController: UIViewController {

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
    
    let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: UITableView.Style.grouped)
    
//    lazy var yearLabel:UILabel = {
//        let label = UILabel()
//        label.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
//        label.text = "1"
//        label.textColor = UIColor.black
//        return label
//    }()
    
    var data:[MonthBillListModel]?{
        didSet{
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleView : UIView = UIView(frame:CGRect(x:0,y:0,width:180,height:30))
        titleView.addSubview(button)
        self.navigationItem.titleView = titleView
//        self.navigationController?.navigationItem.titleView = titleView.addSubview(button)
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(topView)
        self.view.addSubview(tableview)
        topView.backgroundColor = UIColor.white
        ///因为导航栏高度为64，为了方便适配，延时0.01秒先加载navigation
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            self.topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130)
            self.tableview.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - self.topView.frame.height - 49)
        }
        
        //获得月份
        topView.returnMonth = {
            (month) in
            print("\(month)")
        }
        data = MonthBillListModel.getMonthBillListModels()
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 0, y: 0, width: 180, height: 30)
    }
    
    func HideView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.topView.frame = CGRect(x: 0, y: -130, width: self.view.frame.width, height: 130)
            self.tableview.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.bounds.height - 49)
        }, completion: nil)
    }
    func ShowView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130)
            self.tableview.frame = CGRect(x: 0, y: self.topView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - self.topView.frame.height - 49)
        }, completion: nil)
    }
}
extension MonthBillListController:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data![section].datas?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.section)+\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MonthBillCell
        if cell == nil{
            cell = MonthBillCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell!.data = data![indexPath.section].datas![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = MonthSectionHeaderView()
        view.data = data![section]
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }
}
extension MonthBillListController{
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
