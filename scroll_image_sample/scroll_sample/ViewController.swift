//
//  ViewController.swift
//  scroll_sample
//
//  Created by Shinya Hirai on 2015/11/03.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var img: [UIImage] = []
    var imageView01: [UIImageView?] = []
    
    @IBOutlet weak var scrView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像配列を設定
        img = [UIImage(named:"img1.png")!,
            UIImage(named:"img2.png")!,
            UIImage(named:"img3.png")!]
        
        // UIImageViewにUIIimageを追加
        imageView01 = [UIImageView(image:img[0]),
            UIImageView(image:img[1]),
            UIImageView(image:img[2])]
        
        // 全体のサイズ ScrollViewフレームサイズ取得
        let SVSize = scrView.frame.size
        // 画像サイズ x 3　高さ CGSizeMake(240*3, 240)
        scrView.contentSize =
            CGSizeMake(SVSize.width * CGFloat(img.count), SVSize.height)
        
        //UIImageViewのサイズと位置を決めます
        //左右に並べる
        for i in 0...2 {
            
            var x:CGFloat = 0
            var y:CGFloat = 100
            var width:CGFloat = self.view.frame.width
            var height:CGFloat = 240
            
            if i == 0 {
                //x = 0
            } else if i == 1 {
                x = 375
            } else if i == 2 {
                x = 375*2
            }
            
            // Scrollviewに追加
            imageView01[i]!.frame = CGRectMake(x, y, width, height)
            
            // Scrollviewに追加
            scrView.addSubview(imageView01[i]!)
        }
        
        // １ページ単位でスクロールさせる
        scrView.pagingEnabled = true
        
        //scroll画面の初期位置
        scrView.contentOffset = CGPointMake(0, 0);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

