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

class DeletePinViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "doneEditingPins:")
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    func doneEditingPins(sender: AnyObject){
        let editorController = storyboard!.instantiateViewControllerWithIdentifier("DeletePinViewController") as! DeletePinViewController
        navigationController!.pushViewController(editorController, animated: true)
    }
}