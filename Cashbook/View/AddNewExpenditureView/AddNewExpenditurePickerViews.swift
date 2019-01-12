//
//  AddNewExpenditurePickerViews.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/5.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

typealias buttonClickClosure = ()->()
typealias YMDValueChangedClosure = (String)->()
typealias HMSValueChangedClosure = (String)->()

class AddNewExpenditurePickerViews: UIView {

    let YMDPicker = UIDatePicker()
    let HMSPicker = UIDatePicker()
    let topView = UIView.init()
    let PickerView = UIView.init()
    let YMDButton = UIButton.init(type: UIButton.ButtonType.custom)
    let HMSButton = UIButton.init(type: UIButton.ButtonType.custom)
    let refreshButton = UIButton.init(type: UIButton.ButtonType.custom)
    let closeButton = UIButton.init(type: UIButton.ButtonType.custom)
    var timeChoose:Bool?{
        didSet{
            if timeChoose!{
                YMDPicker.isHidden = true
                HMSPicker.isHidden = false
            }
            else{
                HMSPicker.isHidden = true
                YMDPicker.isHidden = false
            }
        }
    }
    
    var callBack:buttonClickClosure?
    var YMDCallBack:YMDValueChangedClosure?
    var HMSCallBack:HMSValueChangedClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTopView()
        setupPicker()
        timeChoose = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTopView(){
        self.addSubview(topView)
        topView.backgroundColor = UIColor.white
        topView.layer.cornerRadius = 7
        topView.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner,CACornerMask.layerMaxXMinYCorner]
        setupCloseButton()
        setupRefreshButton()
        setupYMDButton()
        setupHMSButton()
    }
    
    func setupPicker(){
        self.addSubview(PickerView)
        self.PickerView.backgroundColor = UIColor.white
        setupYMDPicker()
        setupHMSPicker()
        
    }
    func setupYMDPicker(){
        self.PickerView.addSubview(YMDPicker)
        YMDPicker.datePickerMode = .date
        YMDPicker.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
        YMDPicker.addTarget(self, action: #selector(YMDValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    func setupHMSPicker(){
        self.PickerView.addSubview(HMSPicker)
        HMSPicker.isHidden = true
        HMSPicker.datePickerMode = .time
        HMSPicker.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
        HMSPicker.addTarget(self, action: #selector(HMSValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    
    
    func setupYMDButton(){
        self.topView.addSubview(YMDButton)
        YMDButton.setTitle("YMD", for: UIControl.State.normal)
        YMDButton.backgroundColor = UIColor.orange
        YMDButton.addTarget(self, action: #selector(YMDClick), for: UIControl.Event.touchUpInside)
    }
    func setupHMSButton(){
        self.topView.addSubview(HMSButton)
        HMSButton.setTitle("HMS", for: UIControl.State.normal)
        HMSButton.backgroundColor = UIColor.orange
        HMSButton.addTarget(self, action: #selector(HMSClick), for: UIControl.Event.touchUpInside)
    }
    func setupRefreshButton(){
        self.topView.addSubview(refreshButton)
        refreshButton.setTitle("refresh", for: UIControl.State.normal)
        refreshButton.backgroundColor = UIColor.orange
        refreshButton.addTarget(self, action: #selector(refreshClick), for: UIControl.Event.touchUpInside)
    }
    func setupCloseButton(){
        self.topView.addSubview(closeButton)
        closeButton.setTitle("close", for: UIControl.State.normal)
        closeButton.backgroundColor = UIColor.orange
        closeButton.addTarget(self, action: #selector(closeClick), for: UIControl.Event.touchUpInside)
    }
    
    @objc func refreshClick(){
        
    }
    @objc func YMDClick(){
        timeChoose = false
    }
    @objc func HMSClick(){
        timeChoose = true
    }
    @objc func closeClick(){
        if callBack != nil{
            self.callBack!()
        }
    }
    
    @objc func YMDValueChanged(_ datePicker:UIDatePicker){
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "YYYY年MM月dd日"// HH-mm-ss
        print(dateFormater.string(from: chooseDate))
        if YMDCallBack != nil{
            self.YMDCallBack!(dateFormater.string(from: chooseDate))
        }
    }
    @objc func HMSValueChanged(_ datePicker:UIDatePicker){
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "HH:mm"
        print(dateFormater.string(from: chooseDate))
        if HMSCallBack != nil{
            self.HMSCallBack!(dateFormater.string(from: chooseDate))
        }
    }
    override func layoutSubviews() {
        topView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 4)
        PickerView.frame = CGRect(x: 0, y: topView.frame.height, width: self.frame.width, height: self.frame.height - topView.frame.height)
        closeButton.frame = CGRect(x: self.topView.frame.width * 0.89, y: self.topView.frame.height * 3/10, width: self.topView.frame.height * 0.4, height: self.topView.frame.height * 0.4)
        refreshButton.frame = CGRect(x: self.topView.frame.width * 30/640, y: self.topView.frame.height * 3/10, width: self.topView.frame.height * 0.4, height: self.topView.frame.height * 0.4)
        YMDButton.frame = CGRect(x: self.topView.frame.width * 200/640, y: self.topView.frame.height * 3/10, width: self.topView.frame.height * 0.4, height: self.topView.frame.height * 0.4)
        HMSButton.frame = CGRect(x: self.topView.frame.width * 370/640, y: self.topView.frame.height * 3/10, width: self.topView.frame.height * 0.4, height: self.topView.frame.height * 0.4)
        YMDPicker.frame = PickerView.bounds
        HMSPicker.frame = PickerView.bounds
    }
}
