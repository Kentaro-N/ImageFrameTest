//
//  ZoomViewController.swift
//  ImageFrameTest
//
//  Created by 西方健太郎 on 2021/01/11.
//  Copyright © 2021 idea. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    var imageView: UIImageView!
        var scale:CGFloat = 1.0
        var width:CGFloat = 0
        var height:CGFloat = 0
        var screenWidth:CGFloat = 0
        var screenHeight:CGFloat = 0
        
    var count2:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // UIImage インスタンスの生成
        let image = UIImage(named:"image\(count2)")!
        
        // 画像の幅・高さの取得
        width = image.size.width
        height = image.size.height
        
        // UIImageView インスタンス生成
        imageView = UIImageView(image:image)
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // view に ImageView を追加する
        self.view.addSubview(imageView)
        
        // 画面背景を設定
        self.view.backgroundColor = UIColor(red:1.0,green:0.8,blue:0.5,alpha:1.0)
    }
    
    // 画像拡大
    @IBAction func plus(_ sender: Any) {
        if(width*scale < screenWidth*2 ){
                       scale += 0.2
                   }
                      
                   let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
                   imageView.frame = rect;
                   imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
                   self.view.addSubview(imageView)
    }
    
    //画像縮小
    @IBAction func minus(_ sender: Any) {
        if(width*scale > screenWidth/4){
            scale -= 0.2
        }
           
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        imageView.frame = rect;
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        self.view.addSubview(imageView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
