//
//  HealthkitTest.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI
import HealthKit
import HealthKitUI

struct HealthkitTest: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
          .task {
             let store = HKHealthStore()
             let allTypes: Set = [
                 HKQuantityType.workoutType(),
                 HKQuantityType(.activeEnergyBurned),
                 HKQuantityType(.distanceWalkingRunning),
                 HKQuantityType(.heartRate)
             ]
             
             do {
                try await store.requestAuthorization(toShare: allTypes, read: allTypes)
                if HKHealthStore.isHealthDataAvailable() {
                  
                   let workAndRun = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)
                   dump(workAndRun)
                }
             } catch {
                dump(error)
             }
          }
    }
}

#Preview {
    HealthkitTest()
}
 
