//
//  BudgetListCell.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/17.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class BudgetListCell: UITableViewCell {

    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var colorView:UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    lazy var bottomLine:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var priceLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var countLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    var data:BudgetModel?{
        didSet{
            titleLabel.text = data?.title
            colorView.backgroundColor = data?.color
            countLabel.text = "\((data?.count)!)条"
            priceLabel.text = "\((data?.price)!)"
            bottomLine.backgroundColor = data?.color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(colorView)
        self.addSubview(bottomLine)
        self.addSubview(priceLabel)
        self.addSubview(countLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        titleLabel.frame = CGRect(x: 30, y: 10, width: 30, height: 30)
        colorView.frame = CGRect(x: 15, y: 20, width: 10, height: 10)
//        colorView.center = CGPoint(x: 15, y: self.centerY)
//        colorView.frame.size = CGSize(width: 7.5, height: 7.5)
        bottomLine.frame = CGRect(x: 15, y: self.height - 1, width: self.width - 30, height: 1)
        priceLabel.frame = CGRect(x: self.width - LabelTools.shared.getNormalStrW(str: "\((data?.price)!)", strFont: 15, h: 20) - 15, y: 15, width: LabelTools.shared.getNormalStrW(str: "\((data?.price)!)", strFont: 15, h: 20), height: 20)
        countLabel.frame = CGRect(x: titleLabel.frame.maxX, y: 20, width: LabelTools.shared.getNormalStrW(str: "\((data?.count)!)条", strFont: 10, h: 12), height: 12)
    }
    
}
