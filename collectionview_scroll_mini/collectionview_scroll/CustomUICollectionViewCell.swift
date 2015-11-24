//
//  CustomUICollectionViewCell.swift
//  collectionview_scroll
//
//  Created by Shinya Hirai on 2015/11/06.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class CustomUICollectionViewCell: UICollectionViewCell {
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.yellowColor()
        
        textLabel = UILabel(frame: CGRectMake(0, 0, frame.width/2, frame.height/2))
        textLabel?.center = CGPoint(x: frame.width/2, y: frame.height/2)
        textLabel?.text = ""
        textLabel?.font = UIFont.systemFontOfSize(12)
        textLabel?.textAlignment = NSTextAlignment.Center
        textLabel?.backgroundColor = UIColor.orangeColor()
        
        self.contentView.addSubview(textLabel!)
    }
}
