//
//  ViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/13/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var username: String!
    var password: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Obteniendo valores guardados en memoria
        username = defaults.string(forKey: "USERNAME") ?? ""
        password = defaults.string(forKey: "PASSWORD") ?? ""
        
        if self.username != "" && self.password != ""{
            self.performSegue(withIdentifier: "SearchViewController", sender: nil)
        }else{
            self.performSegue(withIdentifier: "LoginViewController", sender: nil)
        }
    }
}
