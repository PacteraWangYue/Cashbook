//
//  LabelTools.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/4.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class LabelTools: NSObject {
    
    static let labelTool = LabelTools()
    static let shared = LabelTools()
    
    func getNormalStrW(str: String, strFont: CGFloat, h: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
    }
    
    func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }
    
    private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
        if str != nil {
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
            return strSize
        }
        
        if attriStr != nil {
            let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
            return strSize
        }
        
        return CGSize.zero
    }
    
    class func getAtrributedStr(attriStr: NSMutableAttributedString? = nil, font: CGFloat, size:CGSize) -> CGSize{
        var width:CGFloat = 0.0
        var height:CGFloat = 0.0
        width = size.width == 0 ? CGFloat.greatestFiniteMagnitude : size.width
        height = size.height == 0 ? CGFloat.greatestFiniteMagnitude : size.height
        if attriStr != nil {
            let strSize = attriStr!.boundingRect(with: CGSize(width: width, height: height), options: .usesLineFragmentOrigin, context: nil).size
            return strSize
        }
        return CGSize.zero
    }
    
    class func getStrSize(str: String? = nil, font: CGFloat, size:CGSize) -> CGSize {
        
        var width:CGFloat = 0.0
        var height:CGFloat = 0.0
        width = size.width == 0 ? CGFloat.greatestFiniteMagnitude : size.width
        height = size.height == 0 ? CGFloat.greatestFiniteMagnitude : size.height
        
        if str != nil {
            
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: width, height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
            return strSize
        }
        
        return CGSize.zero
    }
    
}
