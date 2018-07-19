//
//  ButtonDesign.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 28/05/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonDesign: UIButton {
    
    let gradientLayer = CAGradientLayer() //Receive top and bottom gradient colors
    let borderGradientLayer = CAGradientLayer()
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    
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
    
    
    
    
    
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
    
    
    override func draw(_ rect: CGRect) {
        gradientLayer.frame = bounds
        gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

