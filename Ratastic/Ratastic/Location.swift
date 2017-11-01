//
//  Location.swift
//  Ratastic
//
//  Created by Colby Tobin on 11/1/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class Location: NSObject, NSCoding {

    
    var locationType: String = ""
    var incidentZip: String = ""
    var incidentAddress: String = ""
    var city: String = ""
    var borough: String = ""
    var lat: Float = 0.0
    var lng: Float = 0.0
    
    init(locationType: String, incidentZip: String, incidentAddress: String, city: String, borough: String,
         lat: Float, lng: Float) {
        self.locationType = locationType
        self.incidentZip = incidentZip
        self.incidentAddress = incidentAddress
        self.city = city
        self.borough = borough
        self.lat = lat
        self.lng = lng
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let locationType = aDecoder.decodeObject(forKey: "locationType") as! String
        let incidentZip = aDecoder.decodeObject(forKey: "incidentZip") as! String
        let incidentAddress = aDecoder.decodeObject(forKey: "incidentAddress") as! String
        let city = aDecoder.decodeObject(forKey: "city") as! String
        let borough = aDecoder.decodeObject(forKey: "borough") as! String
        let lat = aDecoder.decodeFloat(forKey: "lat")
        let lng = aDecoder.decodeFloat(forKey: "lng")
        self.init(locationType: locationType, incidentZip: incidentZip, incidentAddress: incidentAddress, city: city, borough: borough, lat: lat, lng: lng)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(locationType, forKey:"locationType")
        aCoder.encode(incidentZip, forKey:"incidentZip")
        aCoder.encode(incidentAddress, forKey:"incidentAddress")
        aCoder.encode(city, forKey:"city")
        aCoder.encode(borough, forKey:"borough")
        aCoder.encode(lat, forKey:"lat")
        aCoder.encode(lng, forKey:"lng")

        
    }
    
    
    
}
