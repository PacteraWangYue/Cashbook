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
        }
        else{
            self.selectedIndex = itemIndex
        }
    }
}
