//
//  ViewController.swift
//  coremotion_sample
//
//  Created by Shinya Hirai on 2015/11/05.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager = CMMotionManager()
    var x = 0
    var y = 0
    var z = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.motionManager.accelerometerUpdateInterval = 0.2
        self.motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue()) {
            (data, error) in
            dispatch_async(dispatch_get_main_queue()) {
                self.updateAccelerationData(data.acceleration)
            }
        }
    }
    
    func updateAccelerationData(data: CMAcceleration) {
        
        println("x = \(Int(data.x)), y = \(Int(data.y)), z = \(Int(data.z))")
        
        var isShaken = self.x != Int(data.x) || self.y != Int(data.y) || self.z != Int(data.z)
        
        if isShaken {
            // シェイクされたときの処理
        }
        
        self.x = Int(data.x)
        self.y = Int(data.y)
        self.z = Int(data.z)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

