//
//  PedometerTest.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI
import CoreMotion

struct PedometerTest: View {
   @State private var nowSteps: NSNumber = 0
   
   var body: some View {
      Text("지금까지 오늘 걸음: \(nowSteps)")
      Button {
         let motionService = CoreMotionService.manager
         motionService.setTodayStep()
         nowSteps = motionService.getTodayStep()
      } label: {
         RoundedRectangle(cornerRadius: 12)
            .fill(.orange)
            .padding()
            .overlay {
               Text("불러오기")
                  .foregroundStyle(.white)
            }
      }
   }
}

#Preview {
   PedometerTest()
}

class CoreMotionService {
   static let manager = CoreMotionService()
   private var pedometer = CMPedometer()
   private let todayStart = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: .now) // 버튼 누르는 시점 (작성 시점)
   private let todayEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: .now) // 작성 종료 시점
   private var todayStep:NSNumber = 0
   
   func setTodayStep() {
      guard let todayStart, let todayEnd else { return }
      
      pedometer.queryPedometerData(from: todayStart, to: todayEnd) { [weak self] pedometerData, error in
         if let error {
            dump(error)
         }
         
         if let pedometerData {
            let steps = pedometerData.numberOfSteps
            self?.todayStep = steps
         }
      }
   }
   
   func getTodayStep() -> NSNumber { return todayStep }
}
