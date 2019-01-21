//
//  BudgetTableView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/17.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class BudgetTableView: UITableView {
    var data:[BudgetModel]?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BudgetTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.section)"+"\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? BudgetListCell
        if cell == nil{
            cell = BudgetListCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.data = data![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BudgetHeaderView()
        view.backgroundColor = UIColor.orange
        return view
    }
    
}
