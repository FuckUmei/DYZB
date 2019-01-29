//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/25.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import Alamofire

class RecommendViewModel {
    lazy var anchorGroup : [AnchorGroup] = [AnchorGroup]()
    fileprivate lazy var bigDataGroups : AnchorGroup = AnchorGroup()
    fileprivate lazy var pretyGroups : AnchorGroup = AnchorGroup()
}


extension RecommendViewModel {
    
    func requstData(_ finishCallback : @escaping () -> () ){
        
        //        guard let resulrDic = jsonDic as? [String : NSObject] else{
        //            return
        //        }
//        let parameters = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
//        NetWorkTool.requestData(URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", type: .get, parameter: ["time" : Date.getCurrentTime()]) { (result) in
//            print(result)
//        }
        let disGroup = DispatchGroup()
     
        disGroup.enter()
        NetWorkTool.requestData(URLString: "http://httpbin.org/get", type: .get) { (result) in
//            print("第一组数据")
            // 1.请求第一部分推荐数据
            let dicbigData = GlobalHelper.loadBundlePath(strName: "getbigDataRoom", strType: "json")
            guard let bigArray = dicbigData["data"] as? [[String:NSObject]] else {
                return
            }
            self.bigDataGroups.tag_name = "热门"
            self.bigDataGroups.icon_name = "home_header_hot"
            for dict in bigArray {
                guard let model = AnchorModel.deserialize(from: dict) else {
                    return
                }
                self.bigDataGroups.room_list?.append(model)
                //            print(model.nickname)
            }
            disGroup.leave()
        }
        
        disGroup.enter()
        NetWorkTool.requestData(URLString: "http://httpbin.org/get", type: .get) { (result) in
//            print("第二组数据")
            // 2.请求第三部分颜值数据 由于json格式错误 只能通过postman获取数据后转到本地文件中
            let dicPrety = GlobalHelper.loadBundlePath(strName: "getVerticalRoom", strType: "json")
            guard let preArray = dicPrety["data"] as? [[String:NSObject]] else {
                return
            }
            self.pretyGroups.tag_name = "颜值"
            self.pretyGroups.icon_name = "home_header_phone"
            for dict in preArray {
                guard let model = AnchorModel.deserialize(from: dict) else {
                    return
                }
                self.pretyGroups.room_list?.append(model)
            }
            disGroup.leave()
        }
        disGroup.enter()
        NetWorkTool.requestData(URLString: "http://httpbin.org/get", type: .get) { (result) in
//            print("第三组数据")
            // 3.请求第二部分游戏数据 由于json格式错误 只能通过postman获取数据后转到本地文件中
            let dicHotche = GlobalHelper.loadBundlePath(strName: "hotache", strType: "json")
            guard let dataArray = dicHotche["data"] as? [[String:NSObject]] else {
                return
            }
            //json 转 model
            for dict in dataArray {
                guard let group = AnchorGroup.deserialize(from: dict) else {
                    return
                }
                self.anchorGroup.append(group)
            }
            
            disGroup.leave()
        }
        
        //所有的数据都请求到,之后进行排序`
        disGroup.notify(queue: DispatchQueue.main){
            self.anchorGroup.insert(self.pretyGroups, at: 0)
            self.anchorGroup.insert(self.bigDataGroups, at: 0)
            
            finishCallback()
        }
        
    }
    
}
