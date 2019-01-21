//
//  SettingViewController.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var data =
    [
        ["SectionName":"系统",
         "SectionData":[
                ["title":"类别","image":"类别.jpg","controllerName":"TypeController"],
                ["title":"标签管理","image":"标签管理.jpg","controllerName":"TypeController"],
                ["title":"每月一览","image":"每月一览.jpg","controllerName":"TypeController"],
                ["title":"货币","image":"货币.jpg","controllerName":"TypeController"],
                ["title":"密码锁","image":"密码锁.jpg","controllerName":"TypeController"]
            ]
        ],
        ["SectionName":"数据",
         "SectionData":[
                ["title":"备份","image":"类别.jpg","controllerName":""]
            ]
        ],
        ["SectionName":"支持",
         "SectionData": [
                ["title":"App评价","image":"App评价.jpg","controllerName":""],
                ["title":"分享","image":"分享.jpg","controllerName":""]
            ]
        ]
    ]
    
    lazy var settingTableview:UITableView = {
       let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.view.bounds.height - 49), style: UITableView.Style.grouped)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingTableview)
    }
    
    override func viewDidLayoutSubviews() {
        settingTableview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 49)
        
    }

}
extension SettingViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionData.count
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rowsData[section].count
        let dic = data[section]
        let sectionDic = dic["SectionData"] as? [Dictionary<String,String>]
        return sectionDic!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.selectionStyle = .none
        let dic = data[indexPath.section]
        let sectionDic = dic["SectionData"] as? [Dictionary<String,String>]
        let title = sectionDic![indexPath.row]["title"]
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (data[section]["SectionName"] as! String)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let namespace = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let dic = data[indexPath.section]
        let sectionDic = dic["SectionData"] as? [Dictionary<String,String>]
        let controllerName = namespace + "." + sectionDic![indexPath.row]["controllerName"]!
        if let controllerClass = NSClassFromString(controllerName) as? UIViewController.Type{
            let vc = controllerClass.init()
            vc.title = sectionDic![indexPath.row]["title"]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
