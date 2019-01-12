//
//  AddNewExpenditureTopView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/2.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

typealias showPickerView = ()->()

class AddNewExpenditureTopView: UIView {
    
    let input = UIView.init()
    let typeView = UIView.init()
    let detailView = UIView.init()
    let timeView = UIView.init()
    
    let inputTextField = UITextField.init()
    let switchButton = UISwitch.init()
    
    let typeLabel = UILabel.init()
    let typeButton = UIButton.init(type: UIButton.ButtonType.custom)
    
    let detailLabel = UILabel.init()
    let detailTextField = UITextField.init()
    let detailTagLabel = UILabel.init()
    
    let timeLabel = UILabel.init()
    let timeDetailLabel = UILabel.init()
    var timeText:String?{
        didSet{
            timeDetailLabel.text = timeText
        }
    }
    let tool = LabelTools()
    let labelFont = CGFloat(15)
    
    var showPicker:showPickerView?
    
    let incomeScrollView = TypeScrollView.init()
    let expendScrollView = TypeScrollView.init()
    var hideScrollViewFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var showScrollViewFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    let opts = UIView.AnimationOptions.curveEaseIn
    
    let incomeDic:Dictionary<String,UIColor> = ["工资":UIColor.randomColor,"奖金":UIColor.randomColor,"投资":UIColor.randomColor]
    let expendData:Dictionary<String,UIColor> = ["食物":UIColor.randomColor,"衣物":UIColor.randomColor,"教育":UIColor.randomColor,"交通":UIColor.randomColor,"医疗":UIColor.randomColor,"娱乐":UIColor.randomColor,"住房":UIColor.randomColor,"社交":UIColor.randomColor]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInput()
        setupTypeView()
        setupDetailView()
        setupTimeView()
        HideScrollView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupInput(){
        self.addSubview(input)
        input.addSubview(inputTextField)
        input.addSubview(switchButton)
        inputTextField.setValue(UIFont.systemFont(ofSize: 70), forKeyPath: "_placeholderLabel.font")
        inputTextField.placeholder = "0"
        switchButton.thumbTintColor = UIColor.white
        switchButton.tintColor = UIColor.green
        if !switchButton.isOn {
            switchButton.tintColor = UIColor.red
        }
        switchButton.addTarget(self, action: #selector(SwitchButtonClick), for: UIControl.Event.touchUpInside)
    }
    func setupTypeView(){
        self.addSubview(typeView)
        typeView.addSubview(typeLabel)
        typeView.addSubview(typeButton)
//        typeView.backgroundColor = UIColor.randomColor
        typeLabel.text = "类别"
        typeLabel.font = UIFont.systemFont(ofSize: labelFont)
        typeButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        typeButton.layer.cornerRadius = 4
        if self.switchButton.isOn {
            typeButton.setTitle("工资", for: UIControl.State.normal)
            typeButton.addTarget(self, action: #selector(ExpendClick), for: UIControl.Event.touchUpInside)
            typeButton.backgroundColor = UIColor.green
        }
        else{
            typeButton.setTitle("食物", for: UIControl.State.normal)
            typeButton.addTarget(self, action: #selector(Incomeclick), for: UIControl.Event.touchUpInside)
            typeButton.backgroundColor = UIColor.red
        }
        setupIncomeScrollView()
        /////
    }
    func setupDetailView(){
        self.addSubview(detailView)
        detailView.addSubview(detailLabel)
        detailView.addSubview(detailTextField)
        detailLabel.font = UIFont.systemFont(ofSize: labelFont)
//        detailView.backgroundColor = UIColor.randomColor
        detailTextField.placeholder = "具体描述"
        detailTextField.setValue(UIFont.systemFont(ofSize: 13), forKeyPath: "_placeholderLabel.font")
        detailLabel.text = "标签"
        detailLabel.font = UIFont.systemFont(ofSize: labelFont)
        
    }
    func setupTimeView(){
        self.addSubview(timeView)
        timeView.addSubview(timeLabel)
        timeView.addSubview(timeDetailLabel)
        timeLabel.text = "时间"
        timeLabel.font = UIFont.systemFont(ofSize: labelFont)
        timeText = Date.currentTimeStr()
        timeDetailLabel.font = UIFont.systemFont(ofSize: labelFont)
        timeDetailLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        timeDetailLabel.addGestureRecognizer(tap)
    }
    
    func setupIncomeScrollView(){
        self.typeView.addSubview(incomeScrollView)
        incomeScrollView.backgroundColor = UIColor.lightGray
        if self.switchButton.isOn{
            incomeScrollView.data = TypeModel.getTypeModels()
        }
        else{
            incomeScrollView.data = TypeModel.getTypeModels2()
        }
        incomeScrollView.getRes = {
            (array) in
            self.typeButton.setTitle(array[0] as? String, for: UIControl.State.normal)
            self.typeButton.backgroundColor = array[1] as? UIColor
            self.typeButton.tag = array[2] as! Int
            self.HideScrollView()
        }
//        incomeScrollView.returnButton = {
//            (array) in
//            self.typeButton.setTitle("\(array[0])", for: UIControl.State.normal)
//            self.typeButton.backgroundColor = array[1] as? UIColor
//            self.HideScrollView()
//        }
    }
    
    func setupExpendScrollView(){
        self.typeView.addSubview(expendScrollView)
        expendScrollView.data = TypeModel.getTypeModels()
    }
    
    @objc func tapClick(){
        if showPicker != nil{
            self.showPicker!()
        }
    }
    
    @objc func Incomeclick(){
        print("tag:"+"\(typeButton.tag)")
        incomeScrollView.frame = self.hideScrollViewFrame
        ShowScrollView()
    }
    
    @objc func ExpendClick(){
        expendScrollView.isHidden = false
        
    }
    @objc func SwitchButtonClick(){
        HideScrollView()
        if self.switchButton.isOn {
            typeButton.setTitle("工资", for: UIControl.State.normal)
            typeButton.addTarget(self, action: #selector(ExpendClick), for: UIControl.Event.touchUpInside)
            typeButton.backgroundColor = UIColor.green
            incomeScrollView.data = TypeModel.getTypeModels()
        }
        else{
            typeButton.setTitle("食物", for: UIControl.State.normal)
            typeButton.addTarget(self, action: #selector(Incomeclick), for: UIControl.Event.touchUpInside)
            typeButton.backgroundColor = UIColor.red
            incomeScrollView.data = TypeModel.getTypeModels2()
        }
    }
    
    func ShowScrollView(){
        self.incomeScrollView.frame = self.hideScrollViewFrame
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            var contentX = self.typeButton.tag * Int(self.typeView.frame.width) * 3 / 20
            if self.incomeScrollView.contentSize.width - CGFloat(contentX) < self.incomeScrollView.frame.width{
                contentX = Int(self.incomeScrollView.contentSize.width - self.incomeScrollView.frame.width)
            }
            self.incomeScrollView.frame = self.showScrollViewFrame
            self.incomeScrollView.contentOffset = CGPoint(x:contentX , y: 0)
            //x: CGFloat(i) * self.frame.width * 3 / 20, y: 0
//            self.incomeScrollView.contentOffset = CGPoint(x: CGFloat(self.typeButton.tag) * 3 / 20, y: 0)
        }, completion: nil)
    }
    
    func HideScrollView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
            self.incomeScrollView.frame = self.hideScrollViewFrame
        }, completion: nil)
    }
    
    override func layoutSubviews() {
        
        let typeLabelWidth = tool.getNormalStrW(str: "类别", strFont: labelFont, h: self.typeView.frame.height)
        let detailLabelWidth = tool.getNormalStrW(str: "标签", strFont: labelFont, h: self.detailView.frame.height)
        let timeLabelWidth = tool.getNormalStrW(str: "时间", strFont: labelFont, h: self.timeLabel.frame.height)
        
        input.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 1/3)
        typeView.frame = CGRect(x: 0, y: self.input.frame.height, width: self.frame.width, height: self.frame.height * 2/9)
        detailView.frame = CGRect(x: 0, y: self.input.frame.height + self.typeView.frame.height, width: self.frame.width, height: self.frame.height * 2/9)
        timeView.frame = CGRect(x: 0, y: self.input.frame.height + self.typeView.frame.height + detailView.frame.height, width: self.frame.width, height: self.frame.height * 2/9)
        
        inputTextField.frame = CGRect(x: 10, y: 0, width: self.input.frame.width-100, height: self.input.frame.height)
        switchButton.center = CGPoint(x: self.input.frame.width - 37 , y: self.input.center.y )
        
        typeLabel.frame = CGRect(x: 10, y: 0, width: typeLabelWidth, height: self.typeView.frame.height)
        typeButton.frame = CGRect(x: self.typeView.frame.width - tool.getNormalStrW(str: "食物", strFont: 20, h: self.typeView.frame.height / 2) - 17, y: self.typeView.frame.height / 6, width: tool.getNormalStrW(str: "食物", strFont: 20, h: self.typeView.frame.height * 2/3), height: self.typeView.frame.height * 2/3)
        //hideScrollViewFrame = CGRect(x: typeView.frame.maxX, y: typeButton.frame.minY, width: typeView.frame.width, height: typeButton.frame.height)
        //showScrollViewFrame = CGRect(x: typeView.frame.minX, y: typeButton.frame.minY, width: typeView.frame.width, height: typeButton.frame.height)
        
        hideScrollViewFrame = CGRect(x: typeView.frame.width, y: 0, width: typeView.frame.width, height: typeView.frame.height)
        showScrollViewFrame = self.typeView.bounds
        
        detailLabel.frame = CGRect(x: 10, y: 0, width: detailLabelWidth, height: self.detailView.frame.height)
        detailTextField.frame = CGRect(x: detailLabelWidth + 20, y: 0, width: self.detailView.frame.width - detailLabelWidth - 20, height: self.detailView.frame.height)
        
        timeLabel.frame = CGRect(x: 10, y: 0, width: timeLabelWidth, height: self.timeView.frame.height)
        timeDetailLabel.frame = CGRect(x:timeLabelWidth+20, y: 0, width: self.timeView.frame.width - 20-timeLabelWidth, height: self.timeView.frame.height)
        
//        incomeScrollView.frame = CGRect(x: 0, y: 0, width: typeView.frame.width, height: typeView.frame.height)
        
    }
}
extension UIColor {
    //返回随机颜色
    open class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

