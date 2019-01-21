//
//  TypeScrollView.swift
//  Cashbook
//
//  Created by 王越 on 2018/12/29.
//  Copyright © 2018 王越. All rights reserved.
//

import UIKit

typealias returnRes = (Array<Any>)->()
class TypeScrollView: UIScrollView {
    
    var getRes :returnRes?
    var data:[TypeModel]?{
        didSet{
            for view in subviews{
                view.removeFromSuperview()
            }
            views.removeAll()
            for i in 0..<(data?.count)!{
                let view = TypeScrollViewCell()
                view.model = data![i]
                view.button.tag = i
                view.returnButton = {
                    (array) in
                    self.getRes!(array)
                }
                self.addSubview(view)
                views.append(view)
            }
        }
    }
    var views:[TypeScrollViewCell] = [TypeScrollViewCell]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.isPagingEnabled = true
        self.isScrollEnabled = true
        self.backgroundColor = UIColor.white
        self.bounces = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if views.count != 0{
            for i in 0..<views.count{
                views[i].frame = CGRect(x: CGFloat(i) * self.frame.width * 3 / 20, y: 0, width: self.frame.width * 3 / 20, height: self.frame.height)
                self.contentSize = CGSize(width: (Int(self.frame.width) * 3 / 20) * views.count, height: 0)
            }
        }
    }
}
