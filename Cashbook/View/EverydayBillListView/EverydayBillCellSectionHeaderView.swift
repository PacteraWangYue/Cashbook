//
//  EverydayBillCellHeaderView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/9.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class EverydayBillCellSectionHeaderView: UIView {

    var data = ["1月8日","22222222","33333333"]
    var colorData = UIColor.red
    
    
    let timeLabel = UILabel.init()
    let incomeView = UIView.init()
    let expendView = UIView.init()
    let incomeLabel = UILabel.init()
    let expendLabel = UILabel.init()
    let incomeImage = UIImageView.init()
    let expendImage = UIImageView.init()
    
    let bottomLineView = UIView()
    let topLineView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTimeLabel()
        setupExpendView()
        setupIncomeView()
        self.backgroundColor = UIColor.lightGray
        self.addSubview(bottomLineView)
        self.addSubview(topLineView)
        bottomLineView.backgroundColor = UIColor.black
        topLineView.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let height = 20/50 * self.frame.height
        let y = 15/50 * self.frame.height
        
        timeLabel.frame = CGRect(x: 15/640 * self.frame.width, y: y, width: 100, height: height)
        
        let incomeLabelWidth = LabelTools.labelTool.getNormalStrW(str: data[1], strFont: 10, h: height)
        let expendLabelWidth = LabelTools.labelTool.getNormalStrW(str: data[2], strFont: 10, h: height)
        
        let space = CGFloat(10)
        
        let ImgWidth = CGFloat(10)
        let ImgHeight = CGFloat(10)
        
        let expendViewWidth = expendLabelWidth + ImgWidth + space
        expendView.frame = CGRect(x: self.frame.width - expendViewWidth, y: y, width: expendViewWidth, height: height)
        let incomeViewWidth = incomeLabelWidth + ImgWidth + space
        
        incomeView.frame = CGRect(x: self.frame.width - incomeViewWidth - expendViewWidth, y: y, width: incomeViewWidth, height: height)
        incomeImage.frame = CGRect(x: 0, y: 0, width: ImgWidth, height: ImgHeight)
        expendImage.frame = CGRect(x: 0, y: 0, width: ImgWidth, height: ImgHeight)
        
        incomeLabel.frame = CGRect(x: 12, y: 0, width: incomeLabelWidth, height: height)
        expendLabel.frame = CGRect(x: 12, y: 0, width: expendLabelWidth, height: height)
        
        bottomLineView.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        topLineView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 1)
    }
    
    func setupTimeLabel(){
        self.addSubview(timeLabel)
        timeLabel.text = data[0]
        timeLabel.font = UIFont.systemFont(ofSize: 12 * Proportion.screenWidthProportion)
    }
    
    func setupIncomeView(){
        self.addSubview(incomeView)
        incomeView.addSubview(incomeImage)
        incomeView.addSubview(incomeLabel)
        incomeImage.backgroundColor = UIColor.green
        incomeLabel.text = data[1]
        incomeLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    func setupExpendView(){
        self.addSubview(expendView)
        expendView.addSubview(expendImage)
        expendView.addSubview(expendLabel)
        expendImage.backgroundColor = UIColor.red
        expendLabel.text = data[2]
        expendLabel.font = UIFont.systemFont(ofSize: 10)
    }
}

