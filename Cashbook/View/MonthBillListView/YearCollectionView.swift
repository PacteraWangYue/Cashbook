//
//  YearCollectionView.swift
//  Cashbook
//
//  Created by 王越 on 2019/1/14.
//  Copyright © 2019 王越. All rights reserved.
//

import UIKit

class YearCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var data:[Int]?
    
    var getYear:((Int)->())?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YearCell", for: indexPath) as? YearCell
        cell?.data = data![indexPath.row]
        return cell!
    }
    

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(YearCell.self, forCellWithReuseIdentifier: "YearCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if getYear != nil{
            let cell = cellForItem(at: indexPath) as? YearCell
            getYear!((cell?.data)!)
        }
    }
    
}

class YearCell:UICollectionViewCell{
    var data:Int?{
        didSet{
            self.addSubview(label)
            label.text = "\(data ?? 0)"
            label.textAlignment = .center
            label.textColor = UIColor.lightGray
        }
    }
    
    let label = UILabel()
    override func layoutSubviews() {
        label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                label.textColor = UIColor.black
            }
            else{
                label.textColor = UIColor.lightGray
            }
        }
    }
}
