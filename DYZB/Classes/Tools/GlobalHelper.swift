//
//  GlobalHelper.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/29.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class GlobalHelper: NSObject {
    
    class func loadBundlePath(strName: String, strType: String) -> NSDictionary {
        let jsonPath = Bundle.main.path(forResource: strName, ofType: strType)
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic:NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        return jsonDic
    }
}
