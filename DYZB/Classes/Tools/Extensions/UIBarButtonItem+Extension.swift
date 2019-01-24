//
//  UIBarButtonItem+Extension.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/14.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createItem(imageName:String, highImageName:String, size: CGSize)->UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
        
    }
    
    // 便利 构造
    convenience init(imageName:String, highImageName:String = "", size: CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }
        else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView: btn)
    }
}
