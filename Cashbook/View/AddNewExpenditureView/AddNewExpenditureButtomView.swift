//
//  AddNewExpenditureButtomView.swift
//  Cashbook
//
//  Created by 王越 on 2018/12/28.
//  Copyright © 2018 王越. All rights reserved.
//

import UIKit

class AddNewExpenditureButtomView: UIView {

    let TopView = AddNewExpenditureTopView.init()
    let AddButton = UIButton(type: UIButton.ButtonType.custom)
    let PickerView = AddNewExpenditurePickerViews.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTopView()
        setupAddButton()
        setupPickerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func Click(){
        print("点击了添加")
    }
    
    func setupTopView(){
        self.addSubview(TopView)
        TopView.backgroundColor = UIColor.white
        TopView.layer.cornerRadius = 7.0
        TopView.layer.masksToBounds = true//切除覆盖在view上的子view的圆角
    }
    
    func setupAddButton(){
        self.addSubview(AddButton)
        AddButton.setTitle("添加", for: UIControl.State.normal)
        AddButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        AddButton.backgroundColor = UIColor.white
        AddButton.addTarget(self, action: #selector(Click), for: UIControl.Event.touchUpInside)
        AddButton.layer.cornerRadius = 7.0
    }
    func setupPickerView(){
        self.addSubview(PickerView)
    }
    
    
    override func layoutSubviews() {
        TopView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.43)
        AddButton.frame = CGRect(x: 0, y: self.TopView.frame.height + self.frame.height * 0.02, width: self.frame.width, height: self.frame.height * 0.1)
        PickerView.frame = CGRect(x: 0, y: self.TopView.frame.height+self.AddButton.frame.height + self.frame.height * 0.02 * 2, width: self.frame.width, height: self.frame.height * 0.42)
    }
}
