//
//  ButtonBorder.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 2/07/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

extension UIButton{
    func gradientBorder(){
        
        //Enable button property View > Drawing > Clip to Bounds
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 18
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [#colorLiteral(red: 0.862745098, green: 0.7647058824, blue: 0.9725490196, alpha: 1).cgColor, #colorLiteral(red: 0.5960784314, green: 0.7725490196, blue: 0.968627451, alpha: 1).cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 5
        
        shape.path = UIBezierPath(roundedRect: self.layer.bounds, cornerRadius: 45).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        
        self.layer.addSublayer(gradient)
    }
}
