//
//  Event+CoreDataProperties.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 06/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var nama: String?
    @NSManaged public var alamat: String?
    @NSManaged public var image: NSData?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
