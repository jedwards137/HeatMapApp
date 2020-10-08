//
//  Extensions.swift
//  Travel Heat
//
//  Created by Jake Edwards on 9/30/20.
//

import Foundation

extension Date {
    func toString() -> String {
        let format = "MM-dd-yyyy HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}

extension String {
    func toDate() -> Date {
        let format = "MM-dd-yyyy HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self) ?? Date(timeIntervalSinceNow: 0)
        return date
    }
    
    func getShortDescription() -> String {
        let endIndex = self.firstIndex(of: ",")
        let newDescription = String(self[..<endIndex!])
        return newDescription
    }
}

extension Location {
    func toDictionary() -> [String:Any] {
        return [
            "latitude": self.Latitude,
            "longitude": self.Longitude,
            "date": self.Date.toString(),
            "description": self.Description
        ]
    }
}

extension Notification.Name {
    static let didUpdateLocations = Notification.Name("didUpdateLocations")
}
