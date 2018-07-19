//
//  ContentViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/12/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var imgNana: UIImageView!
    @IBOutlet weak var loadingImgNana: UIActivityIndicatorView!
    
    var itemIndex: Int = 0
    var objNana: NanaBE!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadingImgNana.startAnimating()
        
        CDMImageDownloaded.descargarImagen(enURL: self.objNana.img, paraImageView: self.imgNana, conPlaceHolder: nil) { (esCorrecto, url, img) in
            if url == self.objNana.img {
                Animation.fadeIn(withDuration: 0.2, objUI: self.imgNana)
                self.imgNana.image = img
                self.loadingImgNana.stopAnimating()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
