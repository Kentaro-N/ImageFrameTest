//
//  ViewController.swift
//  ImageFrameTest
//
//  Created by 西方健太郎 on 2021/01/11.
//  Copyright © 2021 idea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var landscapeImageView: UIImageView!
    
    // タイマー
    var timer: Timer!
    // カウント(経過時間)の変数を作成
    var count = 0
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!
    ]

    //let landscapeImage: UIImage = UIImage(named: "image1")!
    let landscapeImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Labelに現在のカウントの値を表示
        countLabel.text = "\(count)"
        
        // landscapeImageViewの背景にライトグレー色を表示
        landscapeImageView.backgroundColor = UIColor.lightGray
        
        // landscapeImageViewへの画像表示を Aspect Fitにする
        landscapeImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        // landscapeImageViewへ(初期）画像表示
        landscapeImageView.image = imageArray[count]

        //ImageViewのタップ認識をONにする
        landscapeImageView.isUserInteractionEnabled = true
        
        }
    //タッピングの動作
    @IBAction func imageTapGesture(_ sender: Any) {
        //アラートで通知
        let alert = UIAlertController(title: "TapGestureが作動しました", message: "タップされたよ", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(dismiss)
        self.present(alert, animated: true, completion: nil)
    }
    
    //count値確認用表示（本番は要らない）
    @IBOutlet weak var countLabel: UILabel!
    

    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        if self.count != 2 {
            self.count += 1
            countLabel.text = "\(count)"
            landscapeImageView.image = imageArray[count]
            
        } else {
            self.count = 0
            countLabel.text = "\(count)"
            landscapeImageView.image = imageArray[count]
        }
    }
    
    //再生と一時停止ボタン
    @IBOutlet weak var startstopButton: UIButton!
    //タイマーの起動と停止
    @IBAction func startstopTimer(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startstopButton.setTitle("停止", for: .normal)
            
            //進むボタンと停止ボタンのタップ不可にする
            susumuButton.isEnabled = false
            modoruButton.isEnabled = false
            
        }else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            startstopButton.setTitle("再生", for: .normal)
            
            //進むボタンと停止ボタンのタップ不可にする
            susumuButton.isEnabled = true
            modoruButton.isEnabled = true
        }
    }
    
    // 進むボタン IBOutlet
    @IBOutlet weak var susumuButton: UIButton!
    // 進むボタン IBAction
    @IBAction func susumu(_ sender: Any) {
        if self.count != 2 {
            self.count += 1
            countLabel.text = "\(count)"
            landscapeImageView.image = imageArray[count]
        
        } else {
            self.count = 0
            countLabel.text = "\(count)"
            landscapeImageView.image = imageArray[count]
            
        }
    }
    
    // 戻るボタン IBOutlet
    @IBOutlet weak var modoruButton: UIButton!
    // 戻るボタン IBAction
    @IBAction func modoru(_ sender: Any) {
        if self.count != 0 {
            self.count -= 1
            countLabel.text = "\(count)"
            landscapeImageView.image = imageArray[count]
        
        } else {
            self.count = 2
            countLabel.text = "\(count)"
            landscapeImageView.image = imageArray[count]
            
        }
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

