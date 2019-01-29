//
//  CollectionPretyCell.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/23.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPretyCell: CollectionViewBaseCell {

    @IBOutlet weak var cityButton: UIButton!
    
    
    override var anchor : AnchorModel?{
        didSet{
            super.anchor = anchor

            cityButton.setTitle(anchor?.anchor_city, for: .normal)
 
            
        }
    }

}
