//
//  TypeScrollViewCell.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/8.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

typealias getButton = (Array<Any>)->()
class TypeScrollViewCell: UIView {
    
    var model:TypeCellModel?{
        didSet{
            setupButton()
        }
    }
    
    let backgroundView = UIView.init()
    let button = UIButton(type: UIButton.ButtonType.custom)
    var returnButton:getButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView.backgroundColor = UIColor.white
        self.addSubview(backgroundView)
        backgroundView.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(){
        button.setTitle(model?.title, for: UIControl.State.normal)
        button.backgroundColor = UIColor.ColorHex((model?.color)!)
        button.addTarget(self, action: #selector(buttonClick(_:)), for: UIControl.Event.touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.layer.cornerRadius = 4
    }
    
    @objc func buttonClick(_ sender:UIButton){
        returnButton?([sender.titleLabel?.text as Any,sender.backgroundColor as Any,sender.tag])
    }
    
    override func layoutSubviews() {
        backgroundView.frame = self.bounds
        button.frame.size = CGSize(width: self.frame.width * 9/10, height: self.frame.height * 2/3)
        button.center = self.backgroundView.center
    }

}
