//
//  ViewDesign.swift
//  nanamatch_v1.0
//
//  Created by Alumno-DG on 12/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

@IBDesignable
class ViewDesign: UIView {
    
    let gradientLayer = CAGradientLayer() //Receive top and bottom gradient colors
    
    @IBInspectable
    var topGradientColor: UIColor! {
        set{
            self.internalTopGradientColor = newValue ?? .clear
        }get{
            return self.internalTopGradientColor
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor! {
        set{
            self.internalBottomGradientColor = newValue ?? .clear
        }get{
            return self.internalBottomGradientColor
        }
    }
    
    
    var internalTopGradientColor : UIColor?
    var internalBottomGradientColor : UIColor?

    @IBInspectable var cornerRadiusTop: CGFloat = 0 {
        didSet{	
            layer.cornerRadius = cornerRadiusTop
        }
    }
    
    override func draw(_ rect: CGRect) {
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
//        layer.insertSublayer(gradientLayer, at: 0)
        self.clipsToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}
