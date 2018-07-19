//
//  UserBL.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class UserBL: NSObject {
    
    class func login(_ parameterDic: [String:String], User: @escaping Const.User){
        
        UserWS.login(parameterDic, User: User)
    }
    
    class func register(_ user: String, password: String, UserRegister: @escaping Const.UserRegister){
        
        UserWS.register(user, password: password, UserRegister: UserRegister)
    }
    
    class func dataUser(_ User: @escaping Const.User) -> Void{
        UserWS.dataUser(User)
    }
}
