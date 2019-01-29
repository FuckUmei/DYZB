//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/23.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionViewBaseCell {

    @IBOutlet weak var roomNameLab: UILabel!
    
    override var anchor : AnchorModel?{
        didSet{
            super.anchor = anchor
    
            roomNameLab.text = anchor?.room_name
            
        }
    }

}
