//
//  CollectionCycleCell.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/31.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var cycleImgView: UIImageView!
    @IBOutlet weak var cyclelab: UILabel!
    
    var cycModel : CycleModel?{
        didSet{
            cyclelab.text = cycModel?.title
            guard let iconUrl = URL(string:(cycModel?.pic_url)!)  else {
                return
            }
            cycleImgView.kf.setImage(with: iconUrl)
        }
    }
}
