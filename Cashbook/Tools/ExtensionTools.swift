//
//  Tools.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/7.
//  Copyright © 2019 王越. All rights reserved.
//

import Foundation
import UIKit

class Proportion: NSObject {
    static let screenWidthProportion = UIScreen.main.bounds.width/320
    static let screenHeightProportion = UIScreen.main.bounds.height/568
}

extension Date {
    
    static func currentTimeInterval() -> Int64 {
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        return Int64(timeInterval)
    }
    
    static func currentTime() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return timeFormatter.string(from: date)
    }
    static func currentTimeStr() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        return timeFormatter.string(from: date)
    }
    
    static func formatterTimeToDate(stringTime: String) -> Date {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dfmatter.timeZone = TimeZone(abbreviation: "UTC") ?? TimeZone.current
        let date = dfmatter.date(from: stringTime) ?? Date()
        return date
    }
    
    static func timeStampToString(timeStamp: String) -> String {
        let timeInterval: TimeInterval = TimeInterval(timeStamp) ?? Date().timeIntervalSince1970
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeInterval)
        return dfmatter.string(from: date)
    }
    
}
//为 uiview 扩展添加边框功能
extension UIView {
    
    //画线
    private func drawBorder(rect:CGRect,color:UIColor){
        let line = UIBezierPath(rect: rect)
        let lineShape = CAShapeLayer()
        lineShape.path = line.cgPath
        lineShape.fillColor = color.cgColor
        self.layer.addSublayer(lineShape)
    }
    
    //设置右边框
    public func rightBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: self.frame.size.width - width, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    //设置左边框
    public func leftBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置上边框
    public func topBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
    
    
    //设置底边框
    public func buttomBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
}
