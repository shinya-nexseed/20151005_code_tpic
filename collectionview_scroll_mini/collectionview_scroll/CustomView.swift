//
//  CustomView.swift
//  collectionview_scroll
//
//  Created by Shinya Hirai on 2015/11/06.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class CustomView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items: [AnyObject]!
    var labelTitle: UILabel!
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    func setUp() {
        collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.registerClass(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        self.addSubview(collectionView)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: CustomUICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell",
            forIndexPath: indexPath) as! CustomUICollectionViewCell
        cell.textLabel?.text = items[indexPath.row] as? String
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width: CGFloat = self.frame.width / 3 - 2
        let height: CGFloat = 60
        return CGSize(width: width, height: height) // The size of one cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let frame: CGRect = self.frame
        var marginH: CGFloat = 1
        var marginV: CGFloat = 1
        return UIEdgeInsetsMake(marginV, marginH, marginV, marginH) // margin between cells
    }
}
