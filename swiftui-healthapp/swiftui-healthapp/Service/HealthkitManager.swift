//
//  HealthkitManager.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/10/24.
//

import Foundation
import HealthKit

final class HealthkitManager {
   private let healthStore = HKHealthStore()
   
   let shared = HealthkitManager()
   
   private init() {
      Task {
        
      }
   }
}
