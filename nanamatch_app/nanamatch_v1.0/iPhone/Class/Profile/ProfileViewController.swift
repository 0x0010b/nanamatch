//
//  ProfileViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/18/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //Outlet declaration
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserFirstName: UILabel!
    @IBOutlet weak var lblUserAge: UILabel!
    @IBOutlet weak var lblUserDistrict: UILabel!
    @IBOutlet weak var btnUserEditInfo: UIButton!

    @IBOutlet weak var loadingImgUser: UIActivityIndicatorView!
    var objUserBE = UserBE()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgUser.layer.cornerRadius = 20
        self.btnUserEditInfo.gradientBorder()
        self.loadingImgUser.startAnimating()
        
        UserBL.dataUser { (objBE) in
            self.objUserBE = objBE
            self.lblUserFirstName.text = "\(objBE.first_name) \(objBE.last_name)"
            //self.lblUserAge.text = objBE.age ?? "" FALTA AGREGAR CAMPO EN BASE DE DATOS
            self.lblUserAge.text = "17 años"
            self.lblUserDistrict.text = objBE.district
            
            CDMImageDownloaded.descargarImagen(enURL: objBE.img, paraImageView: self.imgUser, conPlaceHolder: nil) { (Correct, url, img) in
                if url == objBE.img {
                    Animation.fadeIn(withDuration: 0.2, objUI: self.imgUser)
                    self.imgUser.image = img
                    self.loadingImgUser.stopAnimating()
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
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
    
    @IBAction func actionEditProfile(_ sender: UIButton) {
        performSegue(withIdentifier: "EditProfileTableViewController", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditProfileTableViewController" {
            let controller = segue.destination as! EditProfileTableViewController
            controller.objUser = self.objUserBE
        }
    }
    
    @IBAction func backToSearchViewController(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindProfileToSearch", sender: nil)
    }
    
    
    
}
