//
//  MapPopupViewController.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 30/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class MapPopupViewController: UIViewController {
    
    @IBOutlet weak var centerConstraintPopup: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.alpha = 0
        self.centerConstraintPopup.constant = 120
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 1
            self.centerConstraintPopup.constant = 38.5
            self.view.layoutIfNeeded()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopup(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 0
            self.centerConstraintPopup.constant = 120
            self.view.layoutIfNeeded()
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
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
