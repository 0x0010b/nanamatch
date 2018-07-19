//
//  TextFieldAppearance.swift
//  nanamatch_v007
//
//  Created by Ernesto Gaspard on 28/05/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

@IBDesignable
class TextFieldAppearance: UITextField {

    @IBInspectable var borderColor : UIColor? = UIColor.clear{
        didSet{
            layer.borderColor = self.borderColor?.cgColor
        }
    }

    @IBInspectable var bottomBorderWidth : CGFloat {
        get{
            return 0.0 //Just to satisfy property
        }
        set{
            let line = UIView(frame: CGRect(x: 0.0, y:bounds.height, width:bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            line.tag = 110
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
        }
    }
    
}
