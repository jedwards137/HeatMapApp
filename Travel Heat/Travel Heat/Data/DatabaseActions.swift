//
//  DatabaseActions.swift
//  Travel Heat
//
//  Created by Jake Edwards on 9/30/20.
//

import Foundation
import FirebaseDatabase

public class DatabaseActions {
    public static func getLocations() {
        let locationsRef = Database.database().reference(withPath: "locations")
        locationsRef.observe(.value) { snapshot in
            var tempLocations: [Location] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot, let location = Location(snapshot: snapshot) {
                    tempLocations.append(location)
                }
            }
            LocationsStore.shared.setLocations(with: tempLocations)
        }
    }

    public static func saveNew(_ location: Location) {
        let newLocationRef = Database.database().reference(withPath: "locations").childByAutoId()
        newLocationRef.setValue(location.toDictionary())
    }
}
