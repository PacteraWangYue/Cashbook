//
//  BudgetHeaderView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/18.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class BudgetHeaderView: UIView {

    lazy var typeImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.white
        return image
    }()
    
    lazy var typeLabel:UILabel = {
        let label = UILabel()
        label.text = "类别"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var priceImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.white
        return image
    }()
    
    lazy var priceLabel:UILabel = {
       let label = UILabel()
       label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "剩余"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        typeImage.frame = CGRect(x: 15, y: 5, width: 15, height: 15)
        priceImage.frame = CGRect(x: 260, y: 5, width: 15, height: 15)
        typeLabel.frame = CGRect(x: typeImage.frame.maxX + 10, y: 0, width: 25, height: 25)
        priceLabel.frame = CGRect(x: priceImage.frame.maxX + 10, y: 0, width: 25, height: 25)
        self.addSubview(typeImage)
        self.addSubview(priceImage)
        self.addSubview(typeLabel)
        self.addSubview(priceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
