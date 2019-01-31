//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/31.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    
    
    var baseGame : AnchorGroup? {
        didSet {
            titleLab.text = baseGame?.tag_name
            
            if let iconURL = URL(string: baseGame?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "home_more_btn")
            }
        }
    }

}
