//
//  MonthBillCell.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/10.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class MonthBillCell: UITableViewCell {
    
    let imageview = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let bottomLineView = UIView()
    
    var data:MonthBillListCellModel?{
        didSet{
            setupImageView()
            setupTitleLabel()
            setupPriceLabel()
            setupBottomLineView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupImageView(){
        self.addSubview(imageview)
        imageview.backgroundColor = data?.color
    }
    
    func setupTitleLabel(){
        self.addSubview(titleLabel)
        titleLabel.text = data?.title
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.backgroundColor = UIColor.green
    }

    func setupPriceLabel(){
        self.addSubview(priceLabel)
        priceLabel.text = "\(data?.price)"
        priceLabel.font = UIFont.systemFont(ofSize: 10)
        priceLabel.textAlignment = .right
    }
    
    func setupBottomLineView(){
        self.addSubview(bottomLineView)
        bottomLineView.backgroundColor = UIColor.lightGray
    }
    
    override func layoutSubviews() {
        imageview.frame = CGRect(x: 15, y: 20, width: 4, height: 4)
        let titleLabelWidth = LabelTools.shared.getNormalStrW(str: (data?.title)!, strFont: 12, h: 20)
        titleLabel.frame = CGRect(x: 25, y: 12, width: titleLabelWidth, height: 20)
        let priceLabelWidth = LabelTools.shared.getNormalStrW(str: "\(data?.price)", strFont: 12, h: 20)
        priceLabel.frame = CGRect(x: self.frame.width - priceLabelWidth - 15, y: 12, width: priceLabelWidth, height: 20)
        bottomLineView.frame = CGRect(x: 15, y: self.frame.height - 1, width: self.frame.width - 30, height: 1)
    }
}
