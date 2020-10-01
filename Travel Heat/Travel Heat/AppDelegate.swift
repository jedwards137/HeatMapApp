//
//  AppDelegate.swift
//  Travel Heat
//
//  Created by Jake Edwards on 9/30/20.
//

import UIKit
import Firebase
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private static let geoCoder = CLGeocoder()
    private let center = UNUserNotificationCenter.current()
    private let locationManager = CLLocationManager()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in }
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
        locationManager.delegate = self
        
        return true
    }
}

extension AppDelegate: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
    // create CLLocation from the coordinates of CLVisit
    let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)

    // Get location description
    AppDelegate.geoCoder.reverseGeocodeLocation(clLocation) { placemarks, _ in
      if let place = placemarks?.first {
        let description = "\(place)"
        self.newVisitReceived(visit, description: description)
      }
    }

  }

  func newVisitReceived(_ visit: CLVisit, description: String) {
    let location = Location(visit: visit, description: description)
    DatabaseActions.saveNew(location)
    // send user notification
    // 1
    let content = UNMutableNotificationContent()
    content.title = "New Location Saved 📌"
    content.body = location.Description.getShortDescription()
    content.sound = .default

    // 2
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: location.Date.toString(), content: content, trigger: trigger)

    // 3
    center.add(request, withCompletionHandler: nil)
  }
}


