//
//  ViewController.swift
//  TableViewSample001
//
//  Created by Shinya Hirai on 2/5/16.
//  Copyright © 2016 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // SecondViewに渡す文字列
    var selectedText: String?
    
    // tableに表示するテキスト
    let texts = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Storyboard上で接続した場合は不要
        // tableView.delegate = self
        // tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(texts[indexPath.row]) - \(indexPath.row)行目"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
        
        // SecondViewControllerに渡す文字列をセット
        selectedText = texts[indexPath.row]
        
        performSegueWithIdentifier("showSecondView",sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destinationViewController as? SecondViewController)!
            
            // SecondViewControllerのtextに選択した文字列を設定する
            secondVC.text = selectedText
        }
    }
    

}

