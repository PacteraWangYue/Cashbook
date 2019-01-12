//
//  MonthSectionHeaderView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/10.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class MonthSectionHeaderView: UIView {

    
    var data:MonthBillListModel?{
        didSet{
            setupTitleLabel()
            setupCountLabel()
            setupBottomLine()
            setupPriceLabel()
        }
    }
    
    let titleLabel = UILabel.init()
    let countLabel = UILabel.init()
    let priceLabel = UILabel.init()
    let bottomLine = UIView.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.randomColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        titleLabel.frame.size = CGSize(width: 30, height: 20)
        titleLabel.center = CGPoint(x: 30, y: self.center.y)
        countLabel.frame = CGRect(x: 50, y: titleLabel.center.y-5, width: 30, height: 15)
        bottomLine.frame = CGRect(x: 15, y: self.frame.height-4, width: self.frame.width - 30, height: 4)
        
        let priceLabelWidth = LabelTools.shared.getNormalStrW(str: "100000000", strFont: 20, h: 25)
        priceLabel.frame.size = CGSize(width: priceLabelWidth , height: 25)
        priceLabel.center = CGPoint(x: self.frame.width - 15 - priceLabelWidth/2, y: self.center.y)
    }
    
    func setupTitleLabel(){
        self.addSubview(titleLabel)
//        titleLabel.text = data?.title
        titleLabel.text = "收入"
        titleLabel.font = UIFont.systemFont(ofSize: 15)
//        titleLabel.backgroundColor = UIColor.randomColor
    }
    
    func setupCountLabel(){
        self.addSubview(countLabel)
        countLabel.text = "\((data?.datas?.count)!)条"
        countLabel.font = UIFont.systemFont(ofSize: 10)
//        countLabel.backgroundColor = UIColor.randomColor
    }
    
    func setupPriceLabel(){
        self.addSubview(priceLabel)
        priceLabel.font = UIFont.systemFont(ofSize: 20)
//        priceLabel.backgroundColor = UIColor.randomColor
        priceLabel.text = "100000000"
//        priceLabel
    }
    
    func setupBottomLine(){
        self.addSubview(bottomLine)
        if titleLabel.text == "收入"{
            bottomLine.backgroundColor = UIColor.green
        }
        else{
            bottomLine.backgroundColor = UIColor.red
        }
    }
}
