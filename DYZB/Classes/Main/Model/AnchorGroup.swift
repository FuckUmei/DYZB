//
//  AnchorGroup.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/28.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import HandyJSON

class AnchorGroup: HandyJSON {
    var icon_name: String = "home_header_normal"
    var icon_url: String!
    var small_icon_url: String!
    var tag_name: String!
    var tag_id: String!
    var push_vertical_screen: String!
    var push_nearby: String!
    var room_list : [AnchorModel]?
    
    required init() {
        room_list = [AnchorModel]()
    }
    

    
}
