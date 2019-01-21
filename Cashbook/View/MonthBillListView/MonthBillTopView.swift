//
//  MonthBillTopView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/14.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

typealias getMonth = (Int)->()
class MonthBillTopView: UIView {
    
    let layout = UICollectionViewFlowLayout.init()
    var collection:UICollectionView?
    var returnMonth:getMonth?
    var returnYear:((Int)->())?
    let headerIdentifier = "CollectionHeaderView"
    let footerIdentifier = "CollectionFooterView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: UIScreen.main.bounds.width, height: 40)
        collection = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collection!.delegate = self
        collection!.dataSource = self
        collection?.register(MonthCell.self, forCellWithReuseIdentifier: "cell")
        collection?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        self.addSubview(collection!)
        collection?.backgroundColor = UIColor.white
//        layout.footerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.collection?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
}
extension MonthBillTopView:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MonthCell
        cell?.backgroundColor = UIColor.white
        cell?.data = "\(indexPath.row)"
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
        if returnMonth != nil{
            returnMonth!(indexPath.row + 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath)
            headerView.backgroundColor = UIColor.randomColor
            
            
            let yearLayout = UICollectionViewFlowLayout()
            yearLayout.itemSize = CGSize(width: 47, height: 20)
            yearLayout.minimumLineSpacing = 5
            yearLayout.minimumInteritemSpacing = 5
            yearLayout.scrollDirection = .horizontal
            yearLayout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
            let yearView = YearCollectionView.init(frame: CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height), collectionViewLayout: yearLayout)
            headerView.addSubview(yearView)
            yearView.showsHorizontalScrollIndicator = false
            yearView.data = [2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015]
            yearView.backgroundColor = UIColor.white
            yearView.getYear = {
                (year) in
                if self.returnYear != nil{
                    self.returnYear!(year)
                }
            }
            return headerView
        }
        else{
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentifier, for: indexPath)
            footerView.backgroundColor = UIColor.randomColor
            return footerView
        }
    }
    
}
