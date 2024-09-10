//
//  HomeView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

struct HomeView: View {
   
   @State private var calories: Int = 123
   @State private var workout: Int = 53
   @State private var standUp: Int = 8
   
   var mockWorkouts: [Workout] = [
      .init(id: 0, title: "오늘 걸음수", subTitle: "목표: 10000보", image: "figure.walk", tint: .green, amount: "6,000"),
      .init(id: 1, title: "오늘 걸음수", subTitle: "목표: 10000보", image: "figure.walk", tint: .green, amount: "6,000"),
      .init(id: 2, title: "오늘 걸음수", subTitle: "목표: 10000보", image: "figure.walk", tint: .green, amount: "6,000"),
      .init(id: 3, title: "오늘 걸음수", subTitle: "목표: 10000보", image: "figure.walk", tint: .green, amount: "6,000")
   ]
   
   var body: some View {
      ScrollView {
         VStack(alignment: .leading, spacing: 16.0) {
            Text("Welcome")
               .font(.largeTitle)
               .padding()
            
            HStack(spacing: 8) {
               Spacer()
               
               VStack(alignment: .leading) {
                  VStack(alignment: .leading, spacing: 8.0) {
                     Text("칼로리")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.red)
                     Text("123 kcal")
                        .bold()
                  }.padding(.bottom)
                  
                  VStack(alignment: .leading, spacing: 8.0) {
                     Text("운동")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.green)
                     Text("123 mins")
                        .bold()
                  }.padding(.bottom)
                  
                  VStack(alignment: .leading, spacing: 8.0) {
                     Text("일어서기")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.blue)
                     Text("8 hours")
                        .bold()
                  }.padding(.bottom)
               }
               
               Spacer()
               
               ZStack {
                  ZStack {
                     ProgressCircleView(progress: $calories, progressGoal: 600, tint: .red)
                     ProgressCircleView(progress: $workout, progressGoal: 80, tint: .green)
                        .padding(.horizontal, 21)
                     ProgressCircleView(progress: $standUp, progressGoal: 10, tint: .blue)
                        .padding(.horizontal, 42)
                  }
               }
               .padding(.horizontal)
            }
            .padding()
            
            HStack {
               Text("운동 활동")
                  .font(.title2)
               Spacer()
               Button {
                  
               } label: {
                  Text("더 보기")
                     .padding(.all, 10)
                     .foregroundStyle(.white)
                     .background(.blue)
                     .clipShape(.rect(cornerRadius: 20.0))
               }
            }
            .padding(.horizontal)
            
            LazyVGrid(
               columns: Array(repeating: .init(spacing: 20), count: 2)
            ) {
               ForEach(mockWorkouts, id:\.id) { workout in
                  WorkoutCardView(workout: workout)
               }
            }
            .padding(.horizontal)
         }
      }
      .scrollIndicators(.hidden)
   }
}

#Preview {
   HomeView()
}
