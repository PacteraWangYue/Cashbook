//
//  MonthCell.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/14.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class MonthCell: UICollectionViewCell {
    let label = UILabel.init()
    let bottomView = UIView.init()
    var data:String?{
        didSet{
            label.text = data
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.black
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                label.font = UIFont.systemFont(ofSize: 13)
                label.textColor = UIColor.red
                bottomView.backgroundColor = UIColor.yellow
            }
            else{
                label.font = UIFont.systemFont(ofSize: 12)
                label.textColor = UIColor.black
                bottomView.backgroundColor = UIColor.white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bottomView)
        bottomView.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        bottomView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        bottomView.layer.cornerRadius = self.frame.width/2
    }
}
