//
//  Post+CoreDataProperties.swift
//  CoreFire
//
//  Created by Joe Ferrucci on 11/18/15.
//  Copyright © 2015 Joe Ferrucci. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Post {

    @NSManaged var title: String?
    @NSManaged var timestamp: NSDate?
    @NSManaged var author: String?
    @NSManaged var user: User?

}
