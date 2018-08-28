//
//  OptionsViewController.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 2/07/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionLogOut(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: "USERNAME")
        defaults.set("", forKey: "PASSWORD")
        defaults.synchronize()
        
        self.dismiss(animated: true, completion: nil)
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
