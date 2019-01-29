//
//  AnchorModel.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/29.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import HandyJSON

class AnchorModel: HandyJSON {
    /// 房间ID
    var room_id : Int = 0
    /// 房间图片对应的URLString
    var vertical_src : String!
    /// 判断是手机直播还是电脑直播
    // 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
    var isVertical : Int = 0
    /// 房间名称
    var room_name : String!
    /// 主播昵称
    var nickname : String!
    /// 观看人数
    var online : Int = 0
    /// 所在城市
    var anchor_city : String!
    
    required init() {}
}
