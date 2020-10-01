//
//  Location.swift
//  Travel Heat
//
//  Created by Jake Edwards on 9/30/20.
//

import Foundation
import CoreLocation
import FirebaseDatabase

public class Location {
    private(set) var Ref: DatabaseReference?
    private(set) var Key: String?
    
    private(set) var Latitude: Double
    private(set) var Longitude: Double
    private(set) var Date: Date
    private(set) var Description: String
    
    convenience init(visit: CLVisit, description: String) {
      self.init(visit.coordinate, date: visit.arrivalDate, description: description)
    }
    
    init(_ location: CLLocationCoordinate2D, date: Date, description: String) {
        self.Latitude =  location.latitude
        self.Longitude =  location.longitude
        self.Date = date
        self.Description = description
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let values = snapshot.value as? [String: AnyObject],
            let latitude = values["latitude"] as? Double,
            let longitude = values["longitude"] as? Double,
            let date = values["date"] as? String,
            let description = values["description"] as? String
            else { return nil }

        self.Key = snapshot.key
        self.Ref = snapshot.ref

        self.Latitude = latitude
        self.Longitude = longitude
        self.Date = date.toDate()
        self.Description = description
    }
}
