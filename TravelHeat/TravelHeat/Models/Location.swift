//
//  Location.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/25/20.
//

import Foundation
import CoreLocation

public class Location: Codable {
    private static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      formatter.timeStyle = .medium
      return formatter
    }()
    
    private(set) var latitude: Double
    private(set) var longitude: Double
    private(set) var date: Date
    private(set) var dateString: String
    private(set) var description: String
    
    init(_ location: CLLocationCoordinate2D, date: Date, descriptionString: String) {
      latitude =  location.latitude
      longitude =  location.longitude
      self.date = date
      dateString = Location.dateFormatter.string(from: date)
      description = descriptionString
    }
    
    convenience init(visit: CLVisit, descriptionString: String) {
      self.init(visit.coordinate, date: visit.arrivalDate, descriptionString: descriptionString)
    }
}
