//
//  CDMWebResponse.swift
//
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

public class CDMWebResponse: NSObject {
    
    public var JSON            : Any?
    public var statusCode      : Int = 404
    public var respuestaNSData : Data?
    public var error           : Error?
    public var datosCabecera   : [String : Any]?
    public var token           : String?
    public var cookie          : String?
    public var successful      : Bool = false
    
    
    //MARK: - Métodos auxiliares
    
    public class func toArray(_ value : Any?) -> [Any]? {
        return value as? [Any]
    }
    
    public class func toDictionary(_ value : Any?) -> [String : Any]? {
        
        return value as? [String : Any]
    }
    
    public class func toArrayDictionary(_ value : Any?) -> [[String : Any]]? {
        
        return value as? [[String : Any]]
    }
    
    public class func toColor(_ value : Any?) -> UIColor {
        
        if value == nil || value is NSNull || !(value is String){
            
            return .black
            
        }else{
            
            return UIColor.colorFromHexString(value as! String, withAlpha: 1)
        }
    }
    
    public class func toString(_ value : Any?) -> String? {
        
        return value as? String
    }
    
    public class func toBool(_ value : Any?) -> Bool? {
        
        return value as? Bool
    }
    
    public class func toInt(_ value : Any?) -> Int? {
        
        return value as? Int
    }
    
    public class func toDouble(_ value : Any?) -> Double? {
        
        return value as? Double
    }
    
    public class func toFloat(_ value : Any?) -> Float? {
        
        return value as? Float
    }
}

