//
//  EverydayBillCell.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

typealias getHeight = (CGFloat)->()
class EverydayBillCell: UITableViewCell {

    var model:EverydayBillListModel?{
        didSet{
            setupTimeLabel()
            setupPriceLabel()
            setupcommentLabel()
            self.addSubview(lineView)
            setupCircleView()
            setupBottomLineView()
            
            lineView.backgroundColor = UIColor.black
            
            let width = Double(self.frame.width)
            
            timeLabel.frame = CGRect(x: 5/64*width, y: 10 , width: 20/64*width, height: 25)
            
            let height = LabelTools.labelTool.getNormalStrH(str: commentLabel.text!, strFont: 12, w: CGFloat(340/640*width))
            commentLabel.frame = CGRect(x: 5/64*width, y: 40, width:340/640*width, height: Double(height))
            priceLabel.frame = CGRect(x: 340/640*width, y: 10, width: 260/640*width, height: 45)
            circleView.frame = CGRect(x: 5, y: 15, width: 10, height: 10)
            
            
            let cellH = commentLabel.frame.maxY > priceLabel.frame.maxY ? commentLabel.frame.maxY:priceLabel.frame.maxY
            if getCellHeight != nil{
                getCellHeight!(cellH + 10)
            }
            lineView.frame = CGRect(x: 10, y: 0, width: 1, height: cellH + 10)
            bottomLineView.frame = CGRect(x: 5/64*width, y: Double(cellH) + 9.5, width: Double(self.frame.width), height: 0.5)
//            bottomLineView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
    }
    
    var getCellHeight:getHeight?
    
    let timeLabel = UILabel()
    let commentLabel = UILabel()
    let priceLabel = UILabel()
    let circleView = UIView()
    let lineView = UIView()
    let bottomLineView = UIView()
    
    var show:Bool = true{
        didSet{
            if show{
                self.bottomLineView.isHidden = false
            }
            else{
                self.bottomLineView.isHidden = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //XIB
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    //XIB
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupTimeLabel(){
        self.addSubview(timeLabel)
        timeLabel.text = model?.title
        timeLabel.font = UIFont.systemFont(ofSize: 12 * Proportion.screenHeightProportion)
    }
    
    func setupcommentLabel(){
        self.addSubview(commentLabel)
        commentLabel.text = model?.comment
        commentLabel.font = UIFont.systemFont(ofSize: 12 * Proportion.screenHeightProportion)
        commentLabel.numberOfLines = 0
        
    }
    
    func setupPriceLabel(){
        self.addSubview(priceLabel)
        priceLabel.textAlignment = .right
        priceLabel.text = "\((model?.money)!)"
        priceLabel.font = UIFont.systemFont(ofSize: 20 * Proportion.screenHeightProportion)
    }
    
    func setupCircleView(){
        self.addSubview(circleView)
        circleView.backgroundColor = UIColor.white
        circleView.layer.cornerRadius = 5
        circleView.layer.masksToBounds = true
        circleView.layer.borderColor = UIColor.red.cgColor
        circleView.layer.borderWidth = 1.5
    }
    
    func setupBottomLineView(){
        self.addSubview(bottomLineView)
        bottomLineView.backgroundColor = UIColor.black
    }
    
}

