//
//  ContentView.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/2/24.
//

/**
 SwitfUI, UIKit의 혼용도 가능하다.
 
 */

import SwiftUI
import HealthKit
import CoreMotion

struct ContentView: View {
   private let store = HKHealthStore()
   @State private var isReady: Bool = false
   
   @State private var start: Date?
   @State private var isStart: Bool = false
   @State private var pause: Date?
   
   @State private var builder: HKWorkoutBuilder?
   
   var body: some View {
      VStack {
         if isReady {
            if isStart {
               Button {
                  pause = Date()
                  isStart = false
                  Task {
                     if let builder {
                        do {
                           try await builder.endCollection(at: .now) // 진짜 종료
                           let interval = builder.elapsedTime(at: .now)
                          
                           print(interval)
                           let statistic = builder.statistics(for: HKQuantityType(.heartRate))
                           print(statistic)
                           let workout = try await builder.finishWorkout() // 저장
                           dump(workout?.allStatistics)
                        } catch {
                           dump(error)
                        }
                     }
                  }
               } label: {
                  Text("정지")
               }
               .padding()
            } else {
               Button {
                  start = Date()
                  isStart = true
                  Task {
                     let config = HKWorkoutConfiguration()
                     config.activityType = .running
                     config.locationType = .outdoor
                     builder = HKWorkoutBuilder(healthStore: store, configuration: config, device: .local())
                     if let builder {
                        do {
                           try await builder.beginCollection(at: .now)
                           try await builder.addWorkoutEvents([.init(type: .lap, dateInterval: .init(start: .now, duration: 2.0), metadata: ["lap": 1])])
                           dump(builder)
                           
                        } catch {
                           dump(error)
                        }
                     }
                  }
               } label: {
                  Text("시작")
               }
               .padding()
            }
         } else {
            Text("not ready")
         }
      }
      .task {
         isReady = await requestPermission()
      }
   }
   
   func requestPermission () async -> Bool {
      let write: Set<HKSampleType> = [.workoutType()]
      let read: Set = [
         .workoutType(),
         HKSeriesType.activitySummaryType(),
         HKSeriesType.workoutRoute(),
         HKSeriesType.workoutType()
      ]
      
      let res: ()? = try? await store.requestAuthorization(toShare: write, read: read)
      guard res != nil else {
         return false
      }
      
      return true
   }
   
   func readWorkouts() async -> [HKWorkout]? {
      let running = HKQuery.predicateForWorkouts(with: .running)
      
      
      let samples = try! await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[HKSample], Error>) in
         store.execute(
            HKSampleQuery(
               sampleType: .workoutType(),
               predicate: running,
               limit: 10,
               sortDescriptors: [.init(keyPath: \HKSample.startDate, ascending: false)],
               resultsHandler: { query, samples, error in
                  if let hasError = error {
                     continuation.resume(throwing: hasError)
                     return
                  }
                  
                  guard let samples = samples else {
                     fatalError("*** Invalid State: This can only fail if there was an error. ***")
                  }
                  
                  continuation.resume(returning: samples)
               }))
      }
      
      guard let workouts = samples as? [HKWorkout] else {
         return nil
      }
      
      return workouts
   }
}

#Preview {
   ContentView()
}
