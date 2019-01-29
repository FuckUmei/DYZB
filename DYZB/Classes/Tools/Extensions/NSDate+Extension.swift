//
//  NSDate+Extension.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/25.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        let interval = Int(nowDate.timeIntervalSince1970)
        return "\(interval)"
    }
}
