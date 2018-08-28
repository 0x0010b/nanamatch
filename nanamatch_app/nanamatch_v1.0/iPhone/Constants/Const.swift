//
//  Const.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class Const: NSObject {
    
    // Authentication Closures
    typealias User = (_ response: UserBE) -> Void
    typealias UserRegister = (_ response: Int) -> Void
    typealias UserUpdate = (_ response: Int) -> Void
    
    // Search & Profile Closures
    typealias Nana = (_ response: [NanaBE]) -> Void
    
}





