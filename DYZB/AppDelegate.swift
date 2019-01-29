//
//  AppDelegate.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/8.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.orange
        
//        Alamofire.request("https://httpbin.org/get", method: .get).responseJSON { (response) in
//            guard let result = response.result.value else {
//                print((response.result.error)!)
//                return
//            }
//            print(result)
//        }
        
//        Alamofire.request("https://httpbin.org/post", method: .post, parameters: ["name" : "specter"]).responseJSON { (reponse) in
//            guard let result = reponse.result.value else {
//                print((reponse.result.error)!)
//                return
//            }
//            print(result)
//        }
        
//        NetWorkTool.requestData(.get, URLString: "https://httpbin.org/get") { (result) in
//            print(result)
//        }
        
//        NetWorkTool.requestData(.post, URLString: "https://httpbin.org/post", parameters:["name" : "specter"]) { (result) in
//            print(result)
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

