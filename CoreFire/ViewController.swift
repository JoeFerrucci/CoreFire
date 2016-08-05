//
//  ViewController.swift
//  CoreFire
//
//  Created by Joe Ferrucci on 11/18/15.
//  Copyright © 2015 Joe Ferrucci. All rights reserved.
//

import UIKit
import SnapKit
import CoreData
import Firebase

let kFirebaseRootURL = "https://postitlater.firebaseio.com"

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        return UITableView()
    }()
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.yellowColor()
        view.addSubview(tableView)
        
        performCoreFireSetup()
        
        performFirebaseTesting()
        
        view.setNeedsUpdateConstraints()
    }
    
    func performCoreFireSetup() {
        let fire: CoreFire = CoreFire()
        fire.managedObjectContext = appDelegate.managedObjectContext
        fire.persistentStoreCoordinator = appDelegate.persistentStoreCoordinator
        fire.firebaseURL = kFirebaseRootURL
        fire.entityName = "Post"
        fire.startMonitor { _ in
            self.tableView.reloadData()
        }
        
        /*
        let entityDescription = NSEntityDescription.entityForName("Post", inManagedObjectContext: appDelegate.managedObjectContext)
        let newPost = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: appDelegate.managedObjectContext)po snap
        newPost.setValue("Joe Ferrucci", forKey: "author")
        newPost.setValue(NSDate(), forKey: "timestamp")
        newPost.setValue("My first blog post", forKey: "title") 
        */
    }
    
    func performFirebaseTesting() {
        print("performFirebaseTesting()")
        let ref: Firebase = Firebase(url: kFirebaseRootURL).childByAppendingPath("posts")
        
        //let arrayOfCoreDataPosts: [NSManagedObject]
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            let s = snapshot.value
            print(s)
            let dict = snapshot.value as! NSDictionary
            for (key,value) in dict {
                print("key:\(key), value:\(value)")
            }
        })
    }
    
    override func updateViewConstraints() {
        
        tableView.snp_updateConstraints { make in
            make.leading.top.equalTo(view).offset(50)
            make.bottom.trailing.equalTo(view).offset(-50)
        }
        
        super.updateViewConstraints()
        
    }
    
}


extension ViewController: UITableViewDelegate {
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        return cell
    }
    
}
