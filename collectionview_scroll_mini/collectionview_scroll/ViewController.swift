//
//  ViewController.swift
//  collectionview_scroll
//
//  Created by Shinya Hirai on 2015/11/06.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    
    var items = [
        ["テスト1", "テスト2", "テスト3"],
        ["テスト11", "テスト22", "テスト33"],
        ["テスト111", "テスト222", "テスト333"],
        ["テスト1111", "テスト2222", "テスト3333"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // スクロールView高さ
        let heightScroll: CGFloat = 80
        
        // スクロールView
        scrollView = UIScrollView(frame: CGRect(x:0, y:heightScroll, width:self.view.frame.width, height:heightScroll))
        scrollView.pagingEnabled = true
        
        // サブView
        for var i=0; i<items.count; i++ {
            var subView = CustomView(frame: CGRect(x: CGFloat(i) * scrollView.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
            subView.items = items[i]
            scrollView.addSubview(subView)
        }
        
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 4, heightScroll)
        self.view.addSubview(scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

