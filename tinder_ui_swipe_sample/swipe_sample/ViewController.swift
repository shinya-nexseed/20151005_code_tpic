//
//  ViewController.swift
//  swipe_sample
//
//  Created by Shinya Hirai on 2015/10/27.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,MDCSwipeToChooseDelegate{
    
    var swipeCount = 0
    var photoURL = [
        "http://livedoor.4.blogimg.jp/jigokuno_misawa/imgs/d/2/d263e300.gif",
        "http://livedoor.4.blogimg.jp/jigokuno_misawa/imgs/3/9/3905191b.gif",
        "http://www.officiallyjd.com/wp-content/uploads/2011/11/20111128_fujimotomiji_15.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeView1 = createSwipeView(photoURL[0])
        self.view.addSubview(swipeView1)
        
        let swipeView2 = createSwipeView(photoURL[1])
        self.view.insertSubview(swipeView2, belowSubview: swipeView1)
        
        let swipeView3 = createSwipeView(photoURL[2])
        self.view.insertSubview(swipeView3, belowSubview: swipeView2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSwipeView(url: String) -> UIView {
        let options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Like"
        options.likedColor = UIColor.greenColor()
        options.nopeText = "Dislike"
        options.nopeColor = UIColor.lightGrayColor()
        
        let swipeView = MDCSwipeToChooseView(
            frame: CGRect(
                x: 0,
                y: 100,
                width: self.view.bounds.size.width,
                height: self.view.bounds.size.height - 300
            ),
            options: options
        )
        let imageURL = NSURL(string: url)
        swipeView.imageView.image = UIImage(data: NSData(contentsOfURL: imageURL!)!)
        
        return swipeView
    }
    
    func view(view: UIView!, wasChosenWithDirection direction: MDCSwipeDirection) {
        if (direction == MDCSwipeDirection.Left) {
            println("Dislike")
        } else {
            println("Like")
        }
        swipeCount++
    }
}