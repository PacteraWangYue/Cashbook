//
//  JJTabBarView.swift
//  moneyBoom
//
//  Created by Pactera on 2019/1/3.
//  Copyright © 2019 16. All rights reserved.
//

import UIKit

// 自定义标签栏代理协议
protocol BaseTabBarDelegate {
    func didChooseItem(itemIndex:Int)
}

class BaseTabBarView: UIView {

    var delegate:BaseTabBarDelegate? // 代理,点击item
    var itemArray:[BaseTabBarItem] = [] // 标签Item数组
    
    init(frame: CGRect,tabbarConfigArr:[Dictionary<String,String>]) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        let screenW = UIScreen.main.bounds.size.width
        let itemWidth = screenW / CGFloat(tabbarConfigArr.count)
        
        for i in 0..<tabbarConfigArr.count{
            let itemDic = tabbarConfigArr[i];
            let itemFrame = CGRect(x: itemWidth * CGFloat(i) , y: 0, width: itemWidth, height: frame.size.height)
            //创建Item视图
            let itemView = BaseTabBarItem(frame: itemFrame, itemDic: itemDic, itemIndex: i)
            self.addSubview(itemView)
            self.itemArray.append(itemView)
            //添加事件点击处理
            itemView.tag = i
            itemView.addTarget(self, action:#selector(self.didItemClick(item:))  , for: UIControl.Event.touchUpInside)
            
            //默认点击第一个,即首页
            if i == 0 {
                self .didItemClick(item: itemView)
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //点击单个标签视图，通过currentSelectState的属性观察器更新标签的显示
    //并且通过代理方法切换标签控制器的当前视图控制器
    @objc func didItemClick(item:BaseTabBarItem){
        for i in 0..<itemArray.count{
            let tempItem = itemArray[i]
            if i == item.tag{
                tempItem.currentSelectState = true
            }else{
                tempItem.currentSelectState = false
            }
        }
        //执行代理方法
        self.delegate?.didChooseItem(itemIndex: item.tag)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        for i in 0..<itemArray.count {

            let item = itemArray[i]
//            let tempoint = item.convert(point, to: self)
            let w = self.frame.size.width/CGFloat(itemArray.count)
            if Int(point.x)/Int(w) == i {
                let newpoint = CGPoint(x: point.x-w*CGFloat(i), y: point.y)
                if item.imgView.frame.contains(newpoint) == true {
                    return item
                }
            }
        }
        return super.hitTest(point, with: event)
    }
}
