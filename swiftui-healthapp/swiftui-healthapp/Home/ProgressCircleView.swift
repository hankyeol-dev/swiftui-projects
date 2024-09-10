//
//  ProgressCircleView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

struct ProgressCircleView: View {
   @Binding var progress: Int
   var progressGoal: Int
   var tint: Color
   var thick = 20.0
   
   var body: some View {
      ZStack {
         Circle()
            .stroke(tint.opacity(0.2), lineWidth: thick)
         
         Circle()
            .trim(from: 0.0, to: CGFloat(progress) / CGFloat(progressGoal))
            .stroke(tint, style: .init(lineWidth: thick, lineCap: .round))
            .rotationEffect(.degrees(-90))
            .shadow(color: .gray, radius: 2.0)
      }
   }
}

#Preview {
   ProgressCircleView(progress: .constant(30), progressGoal: 300, tint: .red)
}
