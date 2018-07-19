//
//  SegueBottomToTop.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 7/3/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class SegueBottomToTop: UIStoryboardSegue {

    override func perform() {
        
        let src = self.source
        let dst = self.destination
        
        let movementValueSrc = CGFloat(UIScreen.main.bounds.height)
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: (src.view)!)
        dst.view.transform = CGAffineTransform(translationX: 0, y: +movementValueSrc)
        
        
        UIView.animate(withDuration: 0.5, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            src.view.transform = CGAffineTransform(translationX: 0, y: -movementValueSrc)
            dst.view.layoutIfNeeded()
            src.view.layoutIfNeeded()
        }) { (_) in
            src.navigationController?.pushViewController(dst, animated: false)
        }
    }
}
