//
//  zoomImageViewController.swift
//  SlideshowApp
//
//  Created by 岩瀬充季 on 2021/02/15.
//

import UIKit

class zoomImageViewController: UIViewController {
    @IBOutlet weak var imageView2: UIImageView!
    var selectedImage: UIImage! = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView2.image = selectedImage
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
