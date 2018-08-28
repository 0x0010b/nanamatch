//
//  NanaWS.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class NanaWS: NSObject {

    class func listNanas(_ Nana: @escaping Const.Nana) -> Void{
        
        let url = "http://nanamatch.ml"
        let path = "nana"
        
        CDMWebSender.doGETToURL(url, withPath: path, withParameter: nil) { (response) in
            let dataJSON = CDMWebResponse.toArrayDictionary(response.JSON) ?? [[:]]
            
            var arrayNanas = [NanaBE]()
            
            for nana in dataJSON {
                
                let objDM = NanaBE()
                objDM.id = CDMWebResponse.toString(nana["id"]) ?? ""
                objDM.img = CDMWebResponse.toString(nana["img"]) ?? ""
                objDM.name = CDMWebResponse.toString(nana["name"]) ?? ""
                objDM.age = CDMWebResponse.toString(nana["age"]) ?? ""
                objDM.district = CDMWebResponse.toString(nana["district"]) ?? ""
                objDM.calification = CDMWebResponse.toString(nana["calification"]) ?? ""
                objDM.information = CDMWebResponse.toString(nana["information"]) ?? ""
                objDM.latitude = CDMWebResponse.toString(nana["latitude"]) ?? "0.0"
                objDM.longitude = CDMWebResponse.toString(nana["longitude"]) ?? "0.0"
                
                arrayNanas.append(objDM)
            }
            Nana(arrayNanas)
        }
    }
    
    class func singleNana(_ id: String, Nana: @escaping Const.SingleNana) -> Void{
        
        let url = "http://nanamatch.ml" 
        let path = "nana/"+id
        
        CDMWebSender.doGETToURL(url, withPath: path, withParameter: nil) { (response) in
            let dataJSON = CDMWebResponse.toArrayDictionary(response.JSON) ?? [[:]]
            
            var arrayNanas = [NanaBE]()
            
            for nana in dataJSON {
                
                let objDM = NanaBE()
                objDM.id = CDMWebResponse.toString(nana["id"]) ?? ""
                objDM.img = CDMWebResponse.toString(nana["img"]) ?? ""
                objDM.name = CDMWebResponse.toString(nana["name"]) ?? ""
                objDM.age = CDMWebResponse.toString(nana["age"]) ?? ""
                objDM.district = CDMWebResponse.toString(nana["district"]) ?? ""
                objDM.calification = CDMWebResponse.toString(nana["calification"]) ?? ""
                objDM.information = CDMWebResponse.toString(nana["information"]) ?? ""
                objDM.latitude = CDMWebResponse.toString(nana["latitude"]) ?? "0.0"
                objDM.longitude = CDMWebResponse.toString(nana["longitude"]) ?? "0.0"
                
                arrayNanas.append(objDM)
            }
            Nana(arrayNanas[0])
        }
    }
}
