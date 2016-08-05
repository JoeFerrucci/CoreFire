//
//  CoreFire.swift
//  CoreFire
//
//  Created by Joe Ferrucci on 11/18/15.
//  Copyright © 2015 Joe Ferrucci. All rights reserved.
//

import Foundation
import CoreData
import Firebase

protocol CoreFireDelegate {
    var firebaseURL: String? { get set }
    var managedObjectContext: NSManagedObjectContext? { get set }
    var persistentStoreCoordinator: NSPersistentStoreCoordinator? { get set }
    var entityName: String? { get set }
}

class CoreFire: NSObject, CoreFireDelegate {
    
    /* Core Data */
    var managedObjectContext: NSManagedObjectContext?
    var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    var entityName: String?
    
    /* Firebase */
    var firebaseURL: String?
    
    /* Initializers */
    override init() {
        super.init()
    }
    
    init(managedObjectContext: NSManagedObjectContext, persistentStoreCoordinator: NSPersistentStoreCoordinator, firebaseURL: String) {
        super.init()
        self.managedObjectContext = managedObjectContext
        self.persistentStoreCoordinator = persistentStoreCoordinator
        self.firebaseURL = firebaseURL
    }
    
    /* Monitor Firebase Endpoints */
    func startMonitor(block: () -> ()) {
        block()
    }
    
}
