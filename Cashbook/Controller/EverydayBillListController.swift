//
//  EverydayBillList.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class EverydayBillListController: UIViewController {
    
    var cellHeights = [[CGFloat]]()
    var models:[EverydayBillListCellModel]? {
        didSet{
            cellHeights.removeAll()
            for i in 0..<models!.count{
                var heights = [CGFloat]()
                for _ in 0..<(models![i].data?.count)! {
                    heights.append(100)
                }
                cellHeights.append(heights)
            }
            tableview.reloadData()
        }
    }
    
    let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: UITableView.Style.grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
//        tableview.separatorColor = UIColor.black
        self.view.addSubview(tableview)
        models = EverydayBillListCellModel.getEverydayBillListCellModel()
        
        
    }
    override func viewDidLayoutSubviews() {
        tableview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 49)
    }
}
extension EverydayBillListController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let num = models![section].data
        return num!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.section)+\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? EverydayBillCell
        if cell == nil{
            cell = EverydayBillCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.getCellHeight = {
            (height) in
            print("\(height)")
            self.cellHeights[indexPath.section][indexPath.row] = height
            //ui 的reload 和tableview.reload不同，没有数据的更新
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        cell?.model = models![indexPath.section].data![indexPath.row]
        if indexPath.row == (models![indexPath.section].data?.count)! - 1 {
            cell?.show = false
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.section][indexPath.row]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = EverydayBillCellSectionHeaderView ()
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "左滑"
    }
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let cellActionA = UITableViewRowAction(style: .default, title: "按钮-1", handler: {_,_ in
//            print("点击了 按钮-1")
//        })
//        cellActionA.backgroundColor = UIColor.green
//        
//        let cellActionB = UITableViewRowAction(style: .default, title: "按钮-2", handler: {_,_ in
//            print("点击了 按钮-2")
//        })
//        return [cellActionA, cellActionB]
//    }
}
