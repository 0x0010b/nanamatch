//
//  SegueRightToLeft.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 30/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class SegueRightToLeft: UIStoryboardSegue {

    override func perform() {
        
        let src = self.source.parent!
        let dst = self.destination
        
        let movementValueSrc = CGFloat(UIScreen.main.bounds.width)
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: (src.view)!)
        dst.view.transform = CGAffineTransform(translationX: +movementValueSrc, y: 0)
        
        
        UIView.animate(withDuration: 0.3, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            src.view.transform = CGAffineTransform(translationX: -movementValueSrc, y: 0)
            dst.view.layoutIfNeeded()
            src.view.layoutIfNeeded()
        }) { (_) in
            src.navigationController?.pushViewController(dst, animated: false)
        }
    }
    
}
