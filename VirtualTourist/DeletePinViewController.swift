//
//  DeletePinViewController.swift
//  VirtualTourist
//
//  Created by Sae on 3/27/16.
//  Copyright © 2016 Sae. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreData

class DeletePinViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Virtual Tourist"
        let doneButton : UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "doneEditingPins:")
        navigationItem.rightBarButtonItem = doneButton
        
        do {
            try fetchedResultsController.performFetch()
        } catch {}
        
        fetchedResultsController.delegate = self
    }
    
    var sharedContext: NSManagedObjectContext {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        
        let fetchRequest = NSFetchRequest(entityName: "Pin")
        fetchRequest.sortDescriptors = []
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
            managedObjectContext: self.sharedContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        return fetchedResultsController
    }()

    
    func doneEditingPins(sender: UIButton) {
        let addController = storyboard!.instantiateViewControllerWithIdentifier("AddPinViewController") as! AddPinViewController
        navigationController!.pushViewController(addController, animated: false)
    }
}