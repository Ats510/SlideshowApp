//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岩瀬充季 on 2021/02/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageindex = 0
    var timer: Timer!
    
    // 写真を追加するなら配列の最後へ。
    let images = [UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"), UIImage(named: "img5.jpg"), UIImage(named: "img6.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 画像の初期設定
        let image_view = images[0]
        imageView.image = image_view
        
        // 再生・停止ボタンの初期設定
        startStop.setTitle("再生", for: .normal)
        
    }

    // 進むボタン
    @IBAction func nextButton(_ sender: Any) {
        if self.timer == nil {
            if imageindex == images.count - 1 {
                imageindex = 0
            } else {
                imageindex += 1
            }
            imageView.image = images[imageindex]
        }
    }
    
    //　戻るボタン
    @IBAction func backButton(_ sender: Any) {
        if self.timer == nil {
            if imageindex == 0 {
                imageindex = images.count - 1
            } else {
                imageindex -= 1
            }
            imageView.image = images[imageindex]
        }
    }
    
    // 再生・停止ボタン
    @IBAction func startStopAction(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage(_:)), userInfo: nil, repeats: true)
            startStop.setTitle("停止", for: .normal)
        } else {
            self.timer.invalidate()
            self.timer = nil
            startStop.setTitle("再生", for: .normal)
        }
    }
    
    // 2秒毎に呼び出される。スライドショー再生中の画像変更。
    @objc func updateImage(_ timer: Timer) {
        if imageindex == images.count - 1 {
            imageindex = 0
        } else {
            imageindex += 1
        }
        imageView.image = images[imageindex]
    }
    
    // 画像をタップすると画面遷移する
    @IBAction func tapOn(_ sender: Any) {
        performSegue(withIdentifier: "toZoomViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toZoomViewController") {
            let subVC: zoomImageViewController = segue.destination as! zoomImageViewController
            subVC.selectedImage = images[imageindex]
        }
    }
    
    // 遷移先から戻ってきたときに呼ばれる。
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

