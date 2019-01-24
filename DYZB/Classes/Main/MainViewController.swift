//
//  MainViewController.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/11.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildTabVC("Recommend")
        addChildTabVC("Recreation")
        addChildTabVC("Follow")
        addChildTabVC("Yuba")
        addChildTabVC("Discovery")
   
        
    }
    
    fileprivate func addChildTabVC(_ storyName:String){
        let childVC = UIStoryboard(name:storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
