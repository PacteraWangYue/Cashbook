//
//  BottomScrollView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/16.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class BottomScrollView: UIScrollView {
    
    var returnPage:((CGFloat)->())?
    var returnRes:(([Dictionary<String,Any>],Int)->())?
    let opts = UIView.AnimationOptions.curveEaseIn
    var data:[[TypeCellModel]]?{
        didSet{
            for view in subviews{
                view.removeFromSuperview()
            }
            tableviews.removeAll()
            for i in 0..<(data?.count)!{
                let tableview = TypeTableView()
                tableview.data = data![i]
                tableview.num = i
                tableview.returnDic = {
                    (dic,num) in
                    if self.returnRes != nil{
                        self.returnRes!(dic,num)
                    }
                }
                tableviews.append(tableview)
                self.addSubview(tableview)
            }
        }
    }
    var currentNum:Int? = 0{
        didSet{
            self.contentOffset.x = CGFloat(currentNum!) * UIScreen.main.bounds.width
        }
    }
    var tableviews = [TypeTableView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isPagingEnabled = true
        self.isScrollEnabled = true
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if tableviews.count != 0{
            for i in 0..<tableviews.count{
                tableviews[i].frame = CGRect(x: CGFloat(i) * self.frame.width, y: 0, width: self.frame.width, height: self.frame.height)
            }
            self.contentSize = CGSize(width: self.frame.width * CGFloat((data?.count)!), height: self.frame.height)
        }
    }
}

extension BottomScrollView:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let scrollWidth = CGFloat((data?.count)!) * self.frame.width
        let page = self.contentOffset.x/self.frame.width
        if returnPage != nil{
            returnPage!(page)
        }
//        let scrollWidth = self.frame.size.width
//        let current = CGFloat((self.contentOffset.x - scrollWidth/2)/scrollWidth) + 1
        
    }
}
