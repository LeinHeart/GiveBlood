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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    var indexList = 0
    
    let namaEvent: [String] = ["Donor Darah United", "Kuy Donor"]
    let alamat: [String] = ["Mall @ Alam Sutera", "AEON Mall BSD"]
    let gambar: [UIImage] = [UIImage(named: "buspmi")!, UIImage(named: "buspmi")!]
    
    
    let locationManager = CLLocationManager()
    public let event1 = CLLocationCoordinate2D(latitude: -6.222709, longitude: 106.652449)
    public let event2 = CLLocationCoordinate2D(latitude: -6.304715, longitude: 106.643998)
    var pin: annotaionPin!
    var pin2: annotaionPin!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        pin = annotaionPin(title: "Donor United", subtitle: "Donor United cabang tanggerang", coordinate: event1)
        
        pin2 = annotaionPin(title: "Kuy Donor", subtitle: "Kuy donor cabang tanggerang", coordinate: event2)
        
        mapView.addAnnotation(pin)
        mapView.addAnnotation(pin2)
        // Do any additional setup after loading the view.
    }
    
    //MARK: -show user location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = location.coordinate
        let region = MKCoordinateRegion(center: center, span: span)
    
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection Section: Int) -> Int {
        return namaEvent.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ViewCellMap
        
        cell.namaEvent.text = namaEvent[indexPath.row]
        
        cell.alamatEvent.text = alamat[indexPath.row]
        
        cell.gambarEvent.image = gambar[indexPath.row]
    
        return cell
    }
    
    //MARK: - redirect 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexList = indexPath.row
        
        let location: CLLocationCoordinate2D = event1
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        indexList = indexPath.row
        
        let location: CLLocationCoordinate2D = event2
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }

    
    /*func mapView(_ mapView:MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "eventLoc")
        annotationView.image = UIImage(named: "mobil")
        let transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        annotationView.transform = transform
        return annotationView
    }*/
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
