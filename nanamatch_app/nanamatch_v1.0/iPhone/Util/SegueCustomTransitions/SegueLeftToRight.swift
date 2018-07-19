//
//  SegueLeftToRight.swift
//  nanamatch_v1.0
//
//  Created by Alumno-DG on 26/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class SegueLeftToRight: UIStoryboardSegue {
    
    override func perform() {
        
        let src = self.source.parent!
        let dst = self.destination
        
        let movementValueSrc = CGFloat(UIScreen.main.bounds.width)
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: (src.view)!)
        dst.view.transform = CGAffineTransform(translationX: -movementValueSrc, y: 0)
        
        
        UIView.animate(withDuration: 0.3, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            src.view.transform = CGAffineTransform(translationX: +movementValueSrc, y: 0)
            dst.view.layoutIfNeeded()
            src.view.layoutIfNeeded()
        }) { (_) in
            src.navigationController?.pushViewController(dst, animated: false)
        }
    }

    
    /*
    let slide_view=destinationViewController.view
    
    src.view.addSubview(slide_view)
    slide_view.transform=CGAffineTransform.init(translationX: src.view.frame.size.width, 0)
    
    UIView.animateWithDuration(0.25,
    delay: 0.0,
    options: UIViewAnimationOptions.CurveEaseInOut,
    animations: {
    slide_view.transform=CGAffineTransform.identity
    }, completion: {finished in
    src.present(dst, animated: false, completion: nil)
    slide_view.removeFromSuperview()
    })
    */
}
