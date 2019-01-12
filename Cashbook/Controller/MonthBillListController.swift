//
//  MonthBillListController.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class MonthBillListController: UIViewController {

    let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: UITableView.Style.grouped)
    var data:[MonthBillListModel]?{
        didSet{
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.randomColor
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
        data = MonthBillListModel.getMonthBillListModels()
        
    }
    
    override func viewDidLayoutSubviews() {
        tableview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 49)
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
}
