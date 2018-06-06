//
//  MapAnnotation.swift
//  GiveBloodApp
//
//  Created by Terretino on 06/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import MapKit

class annotaionPin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
