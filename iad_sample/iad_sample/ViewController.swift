//
//  ViewController.swift
//  iad_sample
//
//  Created by Shinya Hirai on 2015/10/20.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController,ADBannerViewDelegate {

    @IBOutlet weak var centerBanner: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // self.canDisplayBannerAds = true
        
        // iAd(インタースティシャル)のマニュアル表示
        // self.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Manual
        
        // iAd(インタースティシャル)の表示
        // self.requestInterstitialAdPresentation()
        
        self.centerBanner.delegate = self
        self.centerBanner.hidden = true
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.centerBanner?.hidden = false
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return willLeave
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.centerBanner?.hidden = true
    }
    
    
    @IBAction func tapBtn(sender: AnyObject) {
        if self.centerBanner.hidden {
            self.centerBanner.hidden = false
        } else {
            self.centerBanner.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

