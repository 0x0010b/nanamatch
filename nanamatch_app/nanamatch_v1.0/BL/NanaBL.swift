//
//  NanaBL.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/12/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class NanaBL: NSObject {

    class func listNanas(_ Nana: @escaping Const.Nana) -> Void{
        NanaWS.listNanas(Nana)
    }
}
