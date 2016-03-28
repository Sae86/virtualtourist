//
//  Picture.swift
//
//  Copied from ios persistence steps and modified
//

import UIKit
import CoreData

@objc(Pin)

class Pin : NSManagedObject {
    
    struct Keys {
        static let Longitude = "longitude"
        static let Latitude = "latitude"
        static let ID = "id"
    }
    
    @NSManaged var longitude: Double
    @NSManaged var id: NSNumber
    @NSManaged var latitude: Double
    @NSManaged var pictures: [Picture]
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
        let entity =  NSEntityDescription.entityForName("Pin", inManagedObjectContext: context)!
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        
        latitude = dictionary[Keys.Latitude] as! Double
        id = dictionary[Keys.ID] as! Int
        longitude = dictionary[Keys.Longitude] as! Double
    }

}


