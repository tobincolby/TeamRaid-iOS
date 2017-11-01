//
//  RatSighting.swift
//  Ratastic
//
//  Created by Colby Tobin on 11/1/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class RatSighting: NSObject, NSCoding {

    var UID: String = ""
    var createdDate: String = ""
    var location: Location!
    
    static var ratSightingArray: NSMutableArray = NSMutableArray()
    
    
    init(UID: String, createdDate: String, location: Location!) {
        self.UID = UID
        self.createdDate = createdDate
        self.location = location
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let UID = aDecoder.decodeObject(forKey: "UID") as! String
        let createdDate = aDecoder.decodeObject(forKey: "createdDate") as! String
        let location = aDecoder.decodeObject(forKey: "location") as! Location
        self.init(
            UID: UID,
            createdDate: createdDate,
            location: location
        )
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(UID, forKey: "UID")
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(location, forKey: "location")
    }
    
    
    func getUID() -> String {
        return UID
    }
    
    func getCreatedDate() -> String {
        return createdDate
    }
    
    func getLocation() -> Location {
        return location
    }
}
