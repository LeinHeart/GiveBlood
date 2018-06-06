//
//  MapViewController.swift
//  GiveBloodApp
//
//  Created by Terretino on 05/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let event1 = CLLocationCoordinate2D(latitude: -6.222709, longitude: 106.652449)
    var pin: annotaionPin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        pin = annotaionPin(title: "Donor United", subtitle: "Donor United cabang tanggerang", coordinate: event1)
        mapView.addAnnotation(pin)
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = location.coordinate
        let region = MKCoordinateRegion(center: center, span: span)
    
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
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
