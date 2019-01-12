//
//  AddNewExpenditure.swift
//  Cashbook
//
//  Created by 王越 on 2018/12/28.
//  Copyright © 2018 王越. All rights reserved.
//

import UIKit

class AddNewExpenditure: UIView {
    
    let opts = UIView.AnimationOptions.curveEaseIn
    
    let bottomView = AddNewExpenditureButtomView()
    
    let ShowBottomViewFrame = CGRect(x: 10, y: UIScreen.main.bounds.height * (1 - 0.488), width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height * 0.868)
    let HideBottomViewFrame = CGRect(x: 10, y: UIScreen.main.bounds.height + 10, width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height * 0.868)
    let ShowPickerViewFrame = CGRect(x: 10, y: UIScreen.main.bounds.height * (1 - 0.868), width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height * 0.868)
    
    let backView = UIView.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackView()
        self.addSubview(backView)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(bottomView)
        bottomView.frame = HideBottomViewFrame
        bottomView.TopView.showPicker = {
            self.ShowPickerView()
        }
        bottomView.PickerView.callBack = {
            self.HidePickerView()
        }
        bottomView.PickerView.HMSCallBack = {
            (HMS) in
            let strArray = self.bottomView.TopView.timeText!.components(separatedBy: " ")
            self.bottomView.TopView.timeText = strArray[0] + " " + HMS
        }
        bottomView.PickerView.YMDCallBack = {
            (YMD) in
            let strArray = self.bottomView.TopView.timeText!.components(separatedBy: " ")
            self.bottomView.TopView.timeText = YMD + " " + strArray[1]
        }
        
        
    }
    @objc func back(){
        HideView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        HideView()
//    }
    
    func setupBackView(){
        backView.backgroundColor = UIColor.clear
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(back))
        tap.numberOfTapsRequired = 1
        backView.addGestureRecognizer(tap)
    }
    
    func ShowView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.bottomView.frame = self.ShowBottomViewFrame
            self.alpha = 0.9
        }, completion: nil)
    }
    func HideView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.bottomView.frame = self.HideBottomViewFrame
            self.alpha = 0
        }, completion: nil)
    }
    
    func ShowPickerView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.bottomView.frame = self.ShowPickerViewFrame
            self.alpha = 0.9
        }, completion: nil)
    }
    
    func HidePickerView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.bottomView.frame = self.ShowBottomViewFrame
            self.alpha = 0.9
        }, completion: nil)
    }
    
    override func layoutSubviews() {
        backView.frame = self.frame
    }
    
    
}
