//
//  CDMLocationManager.swift
//  MapSalud
//
//  Created by KenyiMetal on 5/10/16.
//  Copyright © 2016 KenyiMetal. All rights reserved.
//

import UIKit
import CoreLocation

public class CDMLocationManager: NSObject, CLLocationManagerDelegate {

    
    public static let sharedInstance = CDMLocationManager()
    public var ubicacionActual : CLLocation?

    
    lazy public var locationManager : CLLocationManager = {
        
        let _locationManager = CLLocationManager()
        
        _locationManager.distanceFilter = 500
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        _locationManager.delegate = self
        _locationManager.requestWhenInUseAuthorization()
        
        return _locationManager
    }()
    
    
    public func iniciarMonitoreo(){
        
        self.locationManager.startUpdatingLocation()
    }
    
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.ubicacionActual = locations.first
    }
}
