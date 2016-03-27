//
//  Picture.swift
//
//  Created by Jason on 1/11/15.
//  Copied from ios persistence steps and modified
//

import UIKit
import CoreData

@objc(Picture)

class Picture : NSManagedObject {
    
    struct Keys {
        static let PicturePath = "picturePath"
        static let ID = "id"
    }

    @NSManaged var id: NSNumber
    @NSManaged var picturePath: String?
    @NSManaged var pin: Pin?
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
        // Core Data
        let entity =  NSEntityDescription.entityForName("Picture", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        // Dictionary
        id = dictionary[Keys.ID] as! Int
        picturePath = dictionary[Keys.PicturePath] as? String

    }

}



