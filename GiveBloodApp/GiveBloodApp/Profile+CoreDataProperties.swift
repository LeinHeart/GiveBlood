//
//  Profile+CoreDataProperties.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 10/07/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var donorLagi: NSDate?
    @NSManaged public var goldar: String?
    @NSManaged public var name: String?
    @NSManaged public var terakhirDonor: NSDate?

}
