//
//  UserWS.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class UserWS: NSObject {

    class func login(_ parameterDic: [String: String], User: @escaping Const.User){
        
        let url  = "http://nanamatch.ml"
        let pathLogin = "login"
        
        CDMWebSender.doPOSTToURL(url, withPath: pathLogin, withParameter: parameterDic) { (response) in
            
            let dataJSON = CDMWebResponse.toDictionary(response.JSON) ?? [:]
            let dataUser = CDMWebResponse.toArrayDictionary(dataJSON["data"]) ?? [[:]]
            
            let status = Int(CDMWebResponse.toString(dataJSON["status"]) ?? "1") ?? 1
            var dicData  = [String:String]()
            
            if status == 0 { // Login Successful
                for row in dataUser {
                    dicData["user"]         = CDMWebResponse.toString(row["user"]) ?? ""
                    dicData["password"]     = CDMWebResponse.toString(row["password"]) ?? ""
                    dicData["first_name"]   = CDMWebResponse.toString(row["first_name"]) ?? ""
                    dicData["last_name"]    = CDMWebResponse.toString(row["last_name"]) ?? ""
                    dicData["distric"]      = CDMWebResponse.toString(row["distric"]) ?? ""
                    dicData["img"]          = CDMWebResponse.toString(row["img"]) ?? ""
                    dicData["address"]      = CDMWebResponse.toString(row["address"]) ?? ""
                    dicData["phone"]        = CDMWebResponse.toString(row["phone"]) ?? ""
                    dicData["cell_phone"]   = CDMWebResponse.toString(row["cell_phone"]) ?? ""
                    dicData["email"]        = CDMWebResponse.toString(row["email"]) ?? ""
                    
                    User(UserBE.parseData(dicData))
                }
            } else{ // Login Failed
                let objBE = UserBE()
                User(objBE)
            }
        }
    }
    
    class func register(_ user: String, password: String, UserRegister: @escaping Const.UserRegister){
        
        let url  = "http://nanamatch.ml"
        let pathRegister = "register"
        
        CDMWebSender.doPOSTToURL(url, withPath: pathRegister, withParameter: ["user": user , "password": password ]) { (response) in
            let dataJSON = CDMWebResponse.toDictionary(response.JSON) ?? [:]
            
            let status = Int(CDMWebResponse.toString(dataJSON["status"]) ?? "1") ?? 1
            UserRegister(status)
        }
        
    }
    
    class func dataUser(_ User: @escaping Const.User) -> Void{
        let username = UserDefaults.standard.string(forKey: "USERNAME") ?? ""
        let url = "http://nanamatch.ml"
        let path = "client/"+username
        
        CDMWebSender.doGETToURL(url, withPath: path, withParameter: nil) { (response) in
            let dataJSON = CDMWebResponse.toArrayDictionary(response.JSON) ?? [[:]]
            var dicData  = [String:String]()
            
            for row in dataJSON {
                dicData["user"]         = CDMWebResponse.toString(row["user"]) ?? ""
                dicData["password"]     = CDMWebResponse.toString(row["password"]) ?? ""
                dicData["first_name"]   = CDMWebResponse.toString(row["first_name"]) ?? ""
                dicData["last_name"]    = CDMWebResponse.toString(row["last_name"]) ?? ""
                dicData["district"]      = CDMWebResponse.toString(row["district"]) ?? ""
                dicData["img"]          = CDMWebResponse.toString(row["img"]) ?? ""
                dicData["address"]      = CDMWebResponse.toString(row["address"]) ?? ""
                dicData["phone"]        = CDMWebResponse.toString(row["phone"]) ?? ""
                dicData["cell_phone"]   = CDMWebResponse.toString(row["cell_phone"]) ?? ""
                dicData["email"]        = CDMWebResponse.toString(row["email"]) ?? ""
                dicData["gender"]        = CDMWebResponse.toString(row["gender"]) ?? ""
                    
                User(UserBE.parseData(dicData))
            }
        }
        
    }
    
    class func updateUser(_ ObjUser: UserBE, UserUpdate: @escaping Const.UserUpdate) -> Void{
        let username = UserDefaults.standard.string(forKey: "USERNAME") ?? ""
        let url = "http://nanamatch.ml"
        let path = "client/update"
        
        CDMWebSender.doPOSTToURL(url, withPath: path, withParameter: ["user":username,"first_name":ObjUser.first_name,"last_name":ObjUser.last_name,"district":ObjUser.district,"address":ObjUser.address,"phone":ObjUser.phone,"cell_phone":ObjUser.cell_phone,"email":ObjUser.email])
        { (response) in
            let dataJSON = CDMWebResponse.toDictionary(response.JSON) ?? [:]
            let status = Int(CDMWebResponse.toString(dataJSON["status"]) ?? "0") ?? 0
            UserUpdate(status)
        }
    }
    
}
