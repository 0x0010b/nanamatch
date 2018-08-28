//
//  DetailsNanaViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/19/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class DetailsNanaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
