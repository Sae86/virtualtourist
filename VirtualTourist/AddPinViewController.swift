//
//  AddPinViewController.swift
//  VirtualTourist
//
//  Created by Sae on 3/27/16.
//  Copyright © 2016 Sae. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class AddPinViewController: UIViewController, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Virtual Tourist"
        let editButton : UIBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "editPins:")
        navigationItem.rightBarButtonItem = editButton
        
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


    func editPins(sender: UIButton) {
        let editorController = storyboard!.instantiateViewControllerWithIdentifier("DeletePinViewController") as! DeletePinViewController
        
        navigationController?.pushViewController(editorController, animated: false)
    }
}

