//
//  CollectionHeaderView.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/23.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    var group : AnchorGroup?{
        didSet {
            titleLab.text = group?.tag_name
            iconView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        
        }
    }
    
    
    
}
