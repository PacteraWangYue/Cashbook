//
//  TypeCell.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/16.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class TypeCell: UITableViewCell {

    var data:TypeModel?{
        didSet{
            titleLabel.text = data?.title
            commentLabel.text = data?.comment
            titleLabel.backgroundColor = data?.color
        }
    }
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var commentLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(commentLabel)
        titleLabel.frame = CGRect(x: 15, y: 10, width: 40, height: 20)
        commentLabel.frame = CGRect(x: 15, y: self.titleLabel.frame.maxY + 10, width: self.frame.width - 15 - 40, height: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
