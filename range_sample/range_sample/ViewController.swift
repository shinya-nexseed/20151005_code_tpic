//
//  ViewController.swift
//  range_sample
//
//  Created by Shinya Hirai on 2015/11/03.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 比較対象の文字列
        var str: NSString = "太るための体づくり"
        // var str: NSString = "太るための体づくり"
        
        //文字列の範囲を取得
        var range: NSRange = str.rangeOfString("太る")
        println(range)
        
        //文字列の位置を取得
        var loc = str.rangeOfString("太る").location
        println(loc)
        
        // locが存在するかどうかで文字があるかどうかを判定
        if loc == NSNotFound && str != "" {
            
            //検索文字がないニュースを削除する
            println("なし")
            
        } else if loc != NSNotFound && str != "" {
            println("あり")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

