//
//  ViewController.swift
//  week7_day5_001_local_authentication
//
//  Created by Shinya Hirai on 2015/11/20.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSettingsBtn(sender: AnyObject) {
        let context = LAContext()
        var error:NSError?
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {}
        
        let localizedReason = "設定情報を表示するには認証を行ってくだだい" // アラートViewに表示する文字を決める
        
        context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason, reply: {
            success, error in
            
            if success {
                println("認証成功")
                // 認証が成功した場合はSettingsViewControllerへ遷移
                let settingsVC = self.storyboard!.instantiateViewControllerWithIdentifier("settingsVC") as! SettingsViewController
                self.presentViewController(settingsVC, animated: true, completion: { () -> Void in
                    // 画面遷移の処理が完了した際に呼ばれる
                    println("画面遷移終了")
                })
                
            } else {
                switch error.code {
                case LAError.AuthenticationFailed.rawValue:
                    println("認証失敗")
                case LAError.UserCancel.rawValue:
                    println("キャンセル")
                case LAError.UserFallback.rawValue:
                    println("パスコード入力を選択")
                case LAError.PasscodeNotSet.rawValue:
                    println("パスコードが設定されていない")
                case LAError.SystemCancel.rawValue:
                    println("システムによってキャンセルされた")
                default:
                    println("不明なエラー")
                    return
                }
            }
        })
    }

}

