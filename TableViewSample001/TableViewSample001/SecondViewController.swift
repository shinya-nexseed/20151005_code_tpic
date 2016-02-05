//
//  SecondViewController.swift
//  TableViewSample001
//
//  Created by Shinya Hirai on 2/5/16.
//  Copyright © 2016 Shinya Hirai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    // ViewControllerから受け取る文字列を入れる変数
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myLabel.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
