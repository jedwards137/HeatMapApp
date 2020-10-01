//
//  Extensions.swift
//  TravelHeat
//
//  Created by Jake Edwards on 9/29/20.
//

import Foundation


extension Date {
    func toReadable() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        let readableDateString = formatter.string(from: self)
        return readableDateString
    }
}

extension String {
    func toDate() -> Date {
        let format = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}
