//
//  CycleModel.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/31.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import HandyJSON

class CycleModel: HandyJSON {

    // 标题
    var title : String = ""
    // 展示的图片地址
    var pic_url : String = ""
    // 主播信息对应的字典
    var room : AnchorModel
    
    required init() {
        room = AnchorModel()
    }
}
