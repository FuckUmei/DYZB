//
//  Common.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/15.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
// iPhone4
let isIphone4 = kScreenH  < 568 ? true : false

// iPhone 5
let isIphone5 = kScreenH  == 568 ? true : false

// iPhone 6
let isIphone6 = kScreenH  == 667 ? true : false

// iphone 6P
let isIphone6P = kScreenH == 736 ? true : false

// iphone X
let isIphoneX = kScreenH == 812 ? true : false

// navigationBarHeight
let kNavigationBarH : CGFloat = isIphoneX ? 88 : 64

// tabBarHeight
let kTabbarH : CGFloat = isIphoneX ? 49 + 34 : 49

let kStatusBarH : CGFloat = 20


