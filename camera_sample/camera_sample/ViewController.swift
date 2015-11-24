//
//  ViewController.swift
//  camera_sample
//
//  Created by Shinya Hirai on 2015/10/20.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var bCameraStart: UIButton!
    
    
    @IBOutlet weak var bSave: UIButton!
    
    
    @IBOutlet weak var bAlbum: UIButton!
    
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var cameraView: UIImageView!
    
    var urlStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = "Tap the [Start] to take a picture"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraStart(sender: AnyObject) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            label.text = "error"
        }
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            cameraView.contentMode = .ScaleAspectFit
            cameraView.image = pickedImage
        }
        
        let assetURL:AnyObject = info[UIImagePickerControllerReferenceURL]! // get asset url
        urlStr = assetURL.description
        let url = NSURL(string: urlStr)// convert phrase to NSURL
        println("url = \(url)")
        
        let assetLib = ALAssetsLibrary()
        assetLib.assetForURL(url, resultBlock: { (asset:ALAsset!) -> Void in
            
            let metadata = asset.defaultRepresentation().metadata()
            
            println("メタデータ = \(metadata)")
            
            }) { (error:NSError!) -> Void in
                
        }
        
        //閉じる処理
        picker.dismissViewControllerAnimated(true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
    }
    

    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        label.text = "Canceled"
    }
    
    
    @IBAction func savePic(sender: AnyObject) {
        let image:UIImage! = cameraView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
        }
        else{
            label.text = "image Failed !"
        }
    }
    
    // 書き込み完了結果の受け取り
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        print("1")
        
        if error != nil {
            print(error.code)
            label.text = "Save Failed !"
        }
        else{
            label.text = "Save Succeeded"
        }
    }
    
    
    @IBAction func showAlbum(sender: AnyObject) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
            label.text = "Tap the [Start] to save a picture"
        }
        else{
            label.text = "error"
            
        }
        
    }

    @IBAction func tapBtn(sender: AnyObject) {
        var image = getImageFromPath(urlStr)
        cameraView.image = image
    }
    
    func getImageFromPath(path: String) -> UIImage? {
        let assetsLibrary = ALAssetsLibrary()
        let url = NSURL(string: path)!
        println("ほげ = \(url)")
        
        var image: UIImage?
        var loadError: NSError?
        assetsLibrary.assetForURL(url, resultBlock: { (asset) -> Void in
            image = UIImage(CGImage: asset.defaultRepresentation().fullResolutionImage().takeUnretainedValue())
            }, failureBlock: { (error) -> Void in
                loadError = error;
        })
        
        println(image)

        
        return image
    }
    
}

