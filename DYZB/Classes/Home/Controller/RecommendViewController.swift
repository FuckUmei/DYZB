//
//  RecommendViewController.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/23.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import Kingfisher

fileprivate let kItemMargin : CGFloat = 10
fileprivate let kItemW = (kScreenW - 3 * kItemMargin) / 2
fileprivate let kNormalItemH = kItemW * 3 / 4
fileprivate let kPretyItemH = kItemW * 4 / 3
fileprivate let kHeadViewH : CGFloat = 50

fileprivate let kNormalCellID = "kNormalCellID"
fileprivate let kPretyCellID = "kPretyCellID"
fileprivate let kHeaderViewID = "kHeaderViewID"

class RecommendViewController: UIViewController {

    fileprivate lazy var recommedVM : RecommendViewModel = RecommendViewModel()
    
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeadViewH)
        // 设置内边距
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.register(CollectionNormalCell.self, forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPretyCell", bundle: nil),
                                forCellWithReuseIdentifier: kPretyCellID)
        
        // headerview
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind:
//            UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        // 随着父控件而拉伸
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
    
        setupUI()
        
        loadData()
    }


}

extension RecommendViewController {
    fileprivate func setupUI() {
        view.addSubview(collectionView)
    }
}

extension RecommendViewController {
    fileprivate func loadData(){
        recommedVM.requstData(){
            self.collectionView.reloadData()
        }
    }
}

extension RecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommedVM.anchorGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = recommedVM.anchorGroup[section]
        return (group.room_list?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let group = recommedVM.anchorGroup[indexPath.section]
        let anchor = group.room_list![indexPath.item]
        
        var cell : CollectionViewBaseCell!
        
        
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPretyCellID, for: indexPath) as? CollectionPretyCell
        }
        else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as? CollectionNormalCell
        }
        
        cell.anchor = anchor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var headerView:CollectionHeaderView!
        
        if kind == UICollectionElementKindSectionHeader{
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as? CollectionHeaderView
        }
        
        headerView.group = recommedVM.anchorGroup[indexPath.section]
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPretyItemH)
        }
        return CGSize(width: kItemW, height: kNormalItemH)
    }
    
    
}


