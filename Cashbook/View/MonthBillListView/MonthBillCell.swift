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
    
    var data:MonthBillListCellModel?{
        didSet{
            setupImageView()
            setupTitleLabel()
            setupPriceLabel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        //test
        //test2
    }
    
    override func layoutSubviews() {
        imageview.frame.size = CGSize(width: 4, height: 4)
        imageview.center = CGPoint(x: 17, y: self.center.y)
        
        let titleLabelWidth = LabelTools.shared.getNormalStrW(str: (data?.title)!, strFont: 15, h: 20)
//        titleLabel.frame.size = CGSize(width: 20, height: 10)
//        titleLabel.center = CGPoint(x: 35, y: self.center.y)
        titleLabel.frame = CGRect(x: 25, y: self.center.y-10, width: titleLabelWidth, height: 20)
    }
}
