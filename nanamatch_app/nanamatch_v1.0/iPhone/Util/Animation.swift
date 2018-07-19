//
//  Animation.swift
//  nanamatch_v0.03
//
//  Created by Ernesto Gaspard on 8/05/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class Animation: NSObject {
    
    
    class func fadeIn(withDuration duration: TimeInterval, objUI: UIView) -> Void {
        objUI.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            objUI.alpha = 1.0
        })
    }
    class func fadeInText(withDuration duration: TimeInterval, objUI: UILabel) -> Void {
        objUI.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            objUI.alpha = 1.0
        })
    }
    class func fadeInImage(withDuration duration: TimeInterval, objUI: UIImageView) -> Void {
        objUI.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            objUI.alpha = 1.0
        })
    }
    class func slideUpPrev(centerConstraintForm: NSLayoutConstraint, viewHeight: CGFloat) -> Void{
        
        centerConstraintForm.constant = centerConstraintForm.constant - viewHeight/3
    }
    class func slideUp(withDuration duration: TimeInterval, centerConstraintForm: NSLayoutConstraint, objView:UIView, viewHeight: CGFloat) -> Void{
        
        UIView.animate(withDuration: duration, animations:{
            centerConstraintForm.constant = centerConstraintForm.constant + viewHeight/3
            objView.layoutIfNeeded()
        })
    }
}
