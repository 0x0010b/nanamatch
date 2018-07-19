//
//  UserBE.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class UserBE: NSObject {

    var user = ""
    var password = ""
    var first_name = ""
    var last_name = ""
    var gender = ""
    var district = ""
    var img = ""
    var address = ""
    var phone = ""
    var cell_phone = ""
    var email = ""
    
    class func parseData(_ dicData: [String:String]) -> UserBE{
        let objBE = UserBE()
        objBE.user          = dicData["user"] ?? ""
        objBE.password      = dicData["password"] ?? ""
        objBE.first_name    = dicData["first_name"] ?? ""
        objBE.last_name     = dicData["last_name"] ?? ""
        objBE.gender        = dicData["gender"] ?? ""
        objBE.district      = dicData["district"] ?? ""
        objBE.img           = dicData["img"] ?? ""
        objBE.address       = dicData["address"] ?? ""
        objBE.phone         = dicData["phone"] ?? ""
        objBE.cell_phone    = dicData["cell_phone"] ?? ""
        objBE.email         = dicData["email"] ?? ""
        
        return objBE
    }
    
}
