//
//  ViewController.swift
//  Cashbook
//
//  Created by 王越 on 2018/12/28.
//  Copyright © 2018 王越. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let newExpenditure = AddNewExpenditure()
    let button = UIButton(type: UIButton.ButtonType.custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        self.view.addSubview(newExpenditure)
        newExpenditure.frame = self.view.frame
        newExpenditure.isHidden = true
        newExpenditure.HideView()
        print("\(Date.currentTimeStr())")
        
    }
    @objc func Click(){
        newExpenditure.isHidden = false
        newExpenditure.ShowView()
    }
    
    func setupButton(){
        button.addTarget(self, action: #selector(Click), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        button.frame = CGRect(origin: self.view.frame.origin, size: CGSize(width: 100, height: 100))
        button.center = self.view.center
        button.frame.size = CGSize(width: 100, height: 100)
        button.setTitle("Click", for: UIControl.State.normal)
        button.setTitleColor(UIColor.red, for: UIControl.State.normal)
    }

}

