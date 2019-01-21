//
//  TopScrollView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/16.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class TopScrollView: UIScrollView {

//    let incomeModels = TypeModel.getTypeModels()
//    let expendModels = TypeModel.getTypeModels2()
    var returnCount:((Int)->())?
    let opts = UIView.AnimationOptions.curveEaseIn
    var buttons = [UIButton]()
    var models:[String]?{
        didSet{
            for view in subviews{
                view.removeFromSuperview()
            }
            buttons.removeAll()
            for i in 0..<(models?.count)!{
                let button = UIButton()
                button.setTitle(models![i], for: UIControl.State.normal)
//                button.backgroundColor = UIColor.red
                button.addTarget(self, action: #selector(click(_:)), for: UIControl.Event.touchUpInside)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//                button.titleLabel?.textAlignment = .left
                button.contentHorizontalAlignment = .left
                button.contentVerticalAlignment = .bottom
                button.tag = i
                button.setTitleColor(UIColor.gray, for: UIControl.State.normal)
                buttons.append(button)
                self.addSubview(button)
            }
            currentNum = 0
        }
    }
    
    var currentNum:Int? = 0{
        didSet{
            UIView.animate(withDuration: 1, delay: 0, options: opts, animations: {
                self.buttons[self.currentNum!].titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                self.buttons[self.currentNum!].setTitleColor(UIColor.black, for: UIControl.State.normal)
            }, completion: nil)
//            buttons[currentNum!].titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//            buttons[currentNum!].setTitleColor(UIColor.black, for: UIControl.State.normal)
        }
        willSet{
            UIView.animate(withDuration: 1, delay: 0, options: opts, animations: {
                self.buttons[self.currentNum!].titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                self.buttons[self.currentNum!].setTitleColor(UIColor.gray, for: UIControl.State.normal)
            }, completion: nil)
//            buttons[currentNum!].titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//            buttons[currentNum!].setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if buttons.count != 0{
            for i in 0..<buttons.count{
                buttons[i].frame = CGRect(x: CGFloat(i) * 70 + 15, y: 0, width: 70, height: 50)
//                self.contentSize = CGSize(width: (Int(self.frame.width) * 3 / 20) * views.count, height: 0)
            }
        }
    }
    
}
extension TopScrollView{
    @objc func click(_ sender:UIButton){
        if sender.tag != currentNum!{
            buttons[currentNum!].titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            buttons[currentNum!].setTitleColor(UIColor.gray, for: UIControl.State.normal)
            currentNum = sender.tag
            if returnCount != nil{
                returnCount!(sender.tag)
            }
        }
        
    }
}
