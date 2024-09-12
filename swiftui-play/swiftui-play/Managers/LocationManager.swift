//
//  LocationManager.swift
//  swiftui-play
//
//  Created by 강한결 on 9/11/24.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject {
   private let locationManager = CLLocationManager()
   
   override init() {
      super.init()
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
   }
}

extension LocationManager: CLLocationManagerDelegate {
   /// grap and update user locations
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      guard !locations.isEmpty else { return }
      locationManager.stopUpdatingLocation()
   }
}
