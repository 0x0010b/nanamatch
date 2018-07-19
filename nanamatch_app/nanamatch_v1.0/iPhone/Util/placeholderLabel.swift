//
//  placeholderLabel.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/25/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

extension UILabel {
    
    func startPlaceholder() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 11
        
        self.text = ""
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.05)
    }
    
    func stopPlaceholder() {
        UIView.animate(withDuration: 0.5) {
            self.backgroundColor = .clear
            self.layoutIfNeeded()
        }
    }
}
