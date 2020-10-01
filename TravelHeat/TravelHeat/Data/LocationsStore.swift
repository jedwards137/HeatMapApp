//
//  LocationsStore.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/25/20.
//

import Foundation
import FirebaseDatabase

public class LocationsStore {
    static let shared = LocationsStore()
    
    init() {
        getLocations()
    }
    
    public var Locations: [Location] = []
    
    public func getLocations() {
        let locationsRef = Database.database().reference(withPath: "locations")
        locationsRef.observe(.value) { snapshot in
            var tempLocations: [Location] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot, let location = Location(snapshot: snapshot) {
                    tempLocations.append(location)
                }
            }
            self.Locations = tempLocations
            
            NotificationCenter.default.post(name: .newLocationSaved, object: self, userInfo: nil)
        }
    }
    
    public func saveNew(_ location: Location) {
        let newLocationRef = Database.database().reference(withPath: "locations").childByAutoId()
        newLocationRef.setValue(location.toAnyObject())
    }
}

extension Notification.Name {
  static let newLocationSaved = Notification.Name("newLocationSaved")
}
