//
//  BaseViewController.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/22.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(nofi:)), name: NSNotification.Name.EndTopicSuccessNoti, object: nil)
    }
    @objc func getNotification(nofi: Notification){
        let str = nofi.userInfo!["post"]
        print(String(describing: str!) + "this notifi")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Notification.Name {
    /// 结束会话成功通知
    static let EndTopicSuccessNoti = Notification.Name(rawValue:"EndTopicSuccess")
}
