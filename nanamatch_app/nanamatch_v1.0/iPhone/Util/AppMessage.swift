//
//  AppMessage.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class AppMessage: NSObject {
    
    class func messagePopup(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        return alert
    }
}
