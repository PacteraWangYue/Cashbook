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
        let window = UIApplication.shared.keyWindow
        window?.addSubview(newExpenditure)
//        self.navigationController?.navigationBar.addSubview(newExpenditure)
        newExpenditure.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        newExpenditure.isHidden = true
        newExpenditure.HideView()
        // Do any additional setup after loading the view.
    }
    override func didChooseItem(itemIndex: Int) {
        if itemIndex == 3{
            newExpenditure.isHidden = false
            newExpenditure.ShowView()
        }else {
            self.selectedIndex = itemIndex
        }
        print(selectedIndex)
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
