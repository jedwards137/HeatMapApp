//
//  LocationsStore.swift
//  Travel Heat
//
//  Created by Jake Edwards on 9/30/20.
//

import Foundation

public class LocationsStore {
    static let shared = LocationsStore()
    
    public var Locations: [Location] = []
    
    init() {
        DatabaseActions.getLocations()
    }
    
    public func setLocations(with locations: [Location]) {
        self.Locations = locations
        NotificationCenter.default.post(name: .didUpdateLocations, object: self, userInfo: nil)
    }
}
