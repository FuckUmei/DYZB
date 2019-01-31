//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/31.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit


fileprivate let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    
    var cycleTimer : Timer?
    var cycleModels : [CycleModel]?{
        didSet{
            self.collectionView.reloadData()
            
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil),
                                forCellWithReuseIdentifier: kCycleCellID)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCycleCellID)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0  
        layout.minimumInteritemSpacing = 0 //item间距
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        // 默认滚动到中间某一个位置
        let indexPath = IndexPath(item: (cycleModels?.count ?? 0) * 100, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
    
}

extension RecommendCycleView{
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}


extension RecommendCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as? CollectionCycleCell
        
        cell!.cycModel = cycleModels![(indexPath as NSIndexPath).item % cycleModels!.count]
        
        
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.red : UIColor.blue
        
        return cell!
    }
}

extension RecommendCycleView : UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2.计算pageControl的currentIndex
        pageControl.currentPage = Int(offset / scrollView.bounds.width) % (cycleModels?.count ?? 1)
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
}

extension RecommendCycleView {
    fileprivate func addCycleTimer(){
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    fileprivate func removeCycleTimer(){
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    @objc fileprivate func scrollToNext(){
        // 1.获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        // 2.滚动该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
}
