//
//  WorkoutCardView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

struct Workout {
   let id: Int
   let title: String
   let subTitle: String
   let image: String
   let tint: Color
   let amount: String
}

struct WorkoutCardView: View {
   @State var workout: Workout
   
   var body: some View {
      ZStack {
         Color(uiColor: .systemGray6)
            .clipShape(.rect(cornerRadius: 16))
         VStack {
            HStack(alignment: .top) {
               VStack(alignment: .leading, spacing: 8) {
                  Text(workout.title)
                  Text(workout.subTitle)
                     .font(.caption)
               }
               Spacer()
               Image(systemName: workout.image)
                  .foregroundStyle(workout.tint)
            }
            
            Text(workout.amount)
               .font(.title)
               .bold()
               .padding()
         }
         .padding()
      }
   }
}

#Preview {
   WorkoutCardView(workout: .init(id: 1, title: "Today's Step", subTitle: "목표: 10000", image: "figure.run", tint: .green, amount: "6000"))
}
