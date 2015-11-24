//
//  ViewController.swift
//  graph_sample
//
//  Created by Shinya Hirai on 2015/11/03.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BEMSimpleLineGraphDelegate,BEMSimpleLineGraphDataSource {

    // サンプルラベル
    var SampleLabel: Array<String> = ["ラベルA", "ラベルB", "ラベルD", "ラベルE", "ラベルF"]
    // サンプルデータ
    var SampleData:  Array<Float> = [10.5, 20.8, 5.3, 12.1, 25.9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // グラフのViewを作成（今回はメインビューと同じ大きさのビューを作ります）
        var GraphView: BEMSimpleLineGraphView = BEMSimpleLineGraphView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        // データソースを設定 (今回はこのクラスの中にメソッドを書くので、selfを設定)
        GraphView.dataSource = self
        // delegateを設定 (今回はこのクラスの中にメソッドを書くので、selfを設定)
        GraphView.delegate = self
        // メインビューにグラフのViewを追加
        self.view.addSubview(GraphView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // グラフのX軸の最大個数を返すメソッドを作成
    func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView) -> NSInteger {
        // 今回はSampleData配列の数を返します
        return SampleData.count
    }
    
    // Y軸の値を返すメソッドを作成
    func lineGraph(graph: BEMSimpleLineGraphView, valueForPointAtIndex index: NSInteger) -> CGFloat {
        //何個目のX軸のポイントかはindexで取得できるので、今回はSampleData配列の中にあるindexの要素をそのまま返します
        return CGFloat(SampleData[index])
    }
    
    // X軸のラベルを返すメソッドを作成
    func lineGraph(graph: BEMSimpleLineGraphView, labelOnXAxisForIndex index: Int) -> String {
        //何個目のX軸のポイントかはindexで取得できるので、今回はSampleLabel配列の中にあるindexの要素をそのまま返します
        return SampleLabel[index] as String
    }

}

