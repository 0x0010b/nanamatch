
//
//  VistaDetalleViewController.swift
//  nanamatch_v1.0
//
//  Created by Alumno-DG on 12/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit



class ViewDetailsNanaViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDistrict: UILabel!
    @IBOutlet weak var lblCalification: UILabel!
    @IBOutlet weak var lblInformation: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewAlpha: UIView!
    
    @IBOutlet weak var viewExtraInformation: UIView!
    
    @IBOutlet weak var btnContact: UIButton!
    
    
    var itemIndex: Int = 0
    var objNana: NanaBE!{
        didSet{
            self.lblName.text = self.objNana.name
            self.lblName.stopPlaceholder()
            
            self.lblDistrict.text = self.objNana.district
            self.lblDistrict.stopPlaceholder()
            
            self.lblCalification.text = self.objNana.calification
            
            self.lblInformation.text = self.objNana.information
        }
    }

    func dismiss() {
        UIView.animate(withDuration: 0.2) {
            self.topConstraint.constant += 12
            self.viewAlpha.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func present() {
        UIView.animate(withDuration: 0.2) {
            self.topConstraint.constant -= 12
            self.viewAlpha.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnContact.gradientBorder()
        
        // Do any additional setup after loading the view.
        self.lblName.startPlaceholder()
        self.lblDistrict.startPlaceholder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
