//
//  BaseModel.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/6.
//  Copyright © 2019 王越. All rights reserved.
//

import Foundation
class BaseModel: NSObject,Codable {
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("forUndefinedKey: \(key)")
    }
}
