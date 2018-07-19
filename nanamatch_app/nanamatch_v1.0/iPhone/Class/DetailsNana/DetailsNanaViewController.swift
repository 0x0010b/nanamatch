//
//  DetailsNanaViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/19/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class DetailsNanaViewController: UIViewController {
    
    @IBOutlet weak var loadingImg: UIActivityIndicatorView!
    
    @IBOutlet weak var imgNana: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var btnContact: UIButton!
    
    @IBAction func closeViewController(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "UnwindDetailsToSearch", sender: nil)
    }
    
    var idNana: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.btnContact.gradientBorder()
        
        self.imgNana.layer.cornerRadius = 20
        self.loadingImg.startAnimating()
        
        NanaBL.singleNana(self.idNana) { (objBE) in
            self.lblName.text = objBE.name
            self.lblAge.text = objBE.age
            self.lblLocation.text = objBE.district
            
            CDMImageDownloaded.descargarImagen(enURL: objBE.img, paraImageView: self.imgNana, conPlaceHolder: nil) { (Correct, url, img) in
                if url == objBE.img {
                    Animation.fadeIn(withDuration: 0.2, objUI: self.imgNana)
                    self.imgNana.image = img
                    self.loadingImg.stopAnimating()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            UIApplication.shared.statusBarView?.backgroundColor = .clear
            UIApplication.shared.statusBarStyle = .default
            
            self.view.layoutIfNeeded()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
