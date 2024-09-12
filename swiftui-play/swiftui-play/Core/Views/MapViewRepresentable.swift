//
//  MapViewRepresentable.swift
//  swiftui-play
//
//  Created by 강한결 on 9/11/24.
//

import UIKit
import MapKit
import SwiftUI

struct MapViewRepresentable: UIViewRepresentable {
   let mapView = MKMapView()
   let locationManager = LocationManager()
   
   func makeUIView(context: Context) -> some UIView {
      mapView.delegate = context.coordinator
      mapView.isRotateEnabled = false
      mapView.showsUserLocation = true
      mapView.userTrackingMode = .follow
      
      return mapView
   }
   
   func updateUIView(_ uiView: UIViewType, context: Context) {}
   
   /// mapview delegate를 채택하는 클래스 안에서 mapviewrepresentable 인스턴스를 활용해서
   /// delegate를 활용할 수 있게 해준다.
   func makeCoordinator() -> MapCoordinator {
      return MapCoordinator(parent: self)
   }
}

extension MapViewRepresentable {
   class MapCoordinator: NSObject, MKMapViewDelegate {
      let parent: MapViewRepresentable
      
      init(parent: MapViewRepresentable) {
         self.parent = parent
         super.init()
      }
      
      func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
         let region = MKCoordinateRegion(
            center: .init(
               latitude: userLocation.coordinate.latitude,
               longitude: userLocation.coordinate.longitude),
            span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
         
         parent.mapView.setRegion(region, animated: true)
      }
   }
}
