//
//  TaskManageView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI

struct TaskManageView: View {
   @State private var current: Date = .now
   @State private var weekSlider: [[Date.WeekdayItem]] = []
   @State private var currentWeek: Int = 0
   @Namespace private var animation
   
   var body: some View {
      VStack(alignment: .leading, spacing: 0) {
         VStack(alignment: .leading) {
            Text(current.formatedDate("YYYY년 MM월"))
               .font(.system(size: 24, weight: .semibold))
            
            TabView(selection: $currentWeek) {
               ForEach(weekSlider.indices, id: \.self) { index in
                  weekDayView(weekSlider[index])
                     .tag(index)
               }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
         }
         .padding()
         .frame(maxWidth: .infinity)
         .background {
            Rectangle()
               .fill(Color(uiColor: .systemGray6))
               .clipShape(
                  .rect(cornerRadius: 30)
               )
               .ignoresSafeArea()
         }
         Spacer()
      }
      .frame(maxWidth: .infinity)
      .onAppear {
         if weekSlider.isEmpty {
            let currentWeek = Date().getWeekDay()
            weekSlider.append(currentWeek)
         }
      }
   }
   
   @ViewBuilder
   func weekDayView(_ weekItems: [Date.WeekdayItem]) -> some View {
      HStack(spacing: 0) {
         ForEach(weekItems, id: \.id) { day in
            VStack {
               Text(day.date.formatedDate("E"))
                  .font(.system(size: 15, weight: .medium))
                  .foregroundStyle(.gray)
               Text(day.date.formatedDate("dd"))
                  .font(.system(size: 20, weight: .semibold))
                  .frame(minWidth: 50, minHeight: 55)
                  .foregroundStyle(isSameDate(day.date, current) ? .white : .black)
                  .background {
                     if isSameDate(day.date, current) {
                        RoundedRectangle(cornerRadius: 12)
                           .fill(.black)
                           .offset(y: 3)
                           .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                     }
                     if day.date.isToday() {
                        Circle()
                           .fill(.white)
                           .frame(width: 5, height: 5)
                           .vSpacing(.bottom)
                     }
                  }
            }
            .hSpacing(.center)
            .onTapGesture {
               withAnimation(.snappy) {
                  current = day.date
               }
            }
         }
      }
   }
}

#Preview {
   TaskManageView()
}
