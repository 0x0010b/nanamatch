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
                objDM.img = CDMWebResponse.toString(nana["img"]) ?? ""
                objDM.name = CDMWebResponse.toString(nana["name"]) ?? ""
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
}
