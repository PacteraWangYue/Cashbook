//
//  JJBaseNavigationController.swift
//  moneyBoom
//
//  Created by 16 on 2019/1/3.
//  Copyright © 2019 16. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = (self as UIGestureRecognizerDelegate)
        //设置导航栏的样式
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//实现手势代理，解决重新自定义导航栏左侧按钮，导致系统自带侧滑手势不可用问题
extension BaseNavigationViewController: UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.children.count == 1 {
            return false
        }
        return true
    }
    
}
