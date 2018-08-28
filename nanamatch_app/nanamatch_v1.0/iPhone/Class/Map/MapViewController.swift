//
//  MapViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/19/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var mapFindNanas: GMSMapView!
    
    var locationManager = CLLocationManager()
    
    var arrayNanas = [NanaBE]()
    
    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locationManager.location?.coordinate
        cameraMoveToLocation(toLocation: location)
    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapFindNanas.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        performSegue(withIdentifier: "PopupViewController", sender: nil)
        print("PEPITO ESTUVO AQUI")
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapFindNanas.delegate = self
        initializeTheLocationManager()
        
        self.mapFindNanas.isMyLocationEnabled = true
        self.mapFindNanas.settings.myLocationButton = true
        
        NanaWS.listNanas { (arrayNana) in
            
            self.arrayNanas = arrayNana
            
            for nana in self.arrayNanas {
                let position = CLLocationCoordinate2D(latitude: CLLocationDegrees(nana.latitude) ?? 0.0, longitude: CLLocationDegrees(nana.longitude) ?? 0.0)
                let nana = GMSMarker(position: position)
                nana.icon = UIImage(named: "nanaMarker")
                nana.map = self.mapFindNanas
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            UIApplication.shared.statusBarView?.backgroundColor = .clear
            UIApplication.shared.statusBarStyle = .default
            
            self.view.layoutIfNeeded()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToSearchViewController(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindMapToSearch", sender: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
