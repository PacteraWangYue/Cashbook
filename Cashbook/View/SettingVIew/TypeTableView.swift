//
//  TypeTableView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/16.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class TypeTableView: UITableView {
    
    var num:Int?
    var returnDic:((_ dics:[Dictionary<String,Any>],_ num:Int)->())?
    
    var data:[TypeCellModel]?{
        didSet{
            self.setEditing(true, animated: true)//允许可以编辑
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension TypeTableView:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.section)+\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TypeCell
        if cell == nil{
            cell = TypeCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.data = data![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("111")
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        if indexPath != newIndexPath {
            let value = self.data![indexPath.row]
            self.data!.remove(at: indexPath.row)
            if newIndexPath.row > (self.data?.count)!{
                self.data?.append(value)
            }
            else{
                self.data?.insert(value, at: newIndexPath.row)
            }
            var dic = [Dictionary<String,Any>]()
            for data in self.data!{
//                print(data.title)
                let res = TypeModel.reflectToDict(model: data)
                dic.append(res)
            }
            print(dic)
            print("")
            
            if returnDic != nil{
                returnDic!(dic, self.num!)
            }
        }
        
    }
}
