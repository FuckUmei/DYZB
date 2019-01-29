//
//  CollectionViewBaseCell.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/29.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class CollectionViewBaseCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var nickNameLab: UILabel!
    
    var anchor : AnchorModel?{
        didSet{
            guard let anchor = anchor else {
                return
            }
            
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online/1000))万在线"
            }else{
                onlineStr = "\(anchor.online)在线"
            }
            onlineButton.setTitle(onlineStr, for: .normal)
            nickNameLab.text = anchor.nickname
            
            guard let iconUrl = URL(string:anchor.vertical_src)  else {
                return
            }
            iconImageView.kf.setImage(with: iconUrl)
            
        }
    }
}
