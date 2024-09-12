//
//  CalendarView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/11/24.
//

import SwiftUI

struct CalendarView: View {
   @StateObject var logic: CalendarViewLogic

   var body: some View {
      CalendarHeader(calendarLogic: logic)
      CalendarGrid(calendarLogic: logic)
   }
   
}

fileprivate struct CalendarHeader: View {
   @ObservedObject var calendarLogic: CalendarViewLogic
   private let weekSymbols = Calendar.current.shortWeekdaySymbols
   
   var body: some View {
      VStack {
         HStack {
            HStack(alignment: .center, spacing: 16) {
               Button {
                  calendarLogic.switchCurrentMonth(by: -1)
               } label: {
                  Image(systemName: "chevron.left")
                     .font(.headline)
                     .foregroundStyle(
                        calendarLogic.canMovePreviousMonth()
                        ? Color(uiColor: .systemBlue)
                        : Color(uiColor: .darkGray)
                     )
               }
               .disabled(!calendarLogic.canMovePreviousMonth())
               
               Text(calendarLogic.month, formatter: calendarLogic.currentMonthFormatter())
                  .font(.headline.bold())
               
               Button {
                  calendarLogic.switchCurrentMonth(by: 1)
               } label: {
                  Image(systemName: "chevron.right")
                     .font(.headline)
                     .foregroundStyle(
                        calendarLogic.canMoveNextMonth()
                        ? Color(uiColor: .systemBlue)
                        : Color(uiColor: .darkGray)
                     )
               }
               .disabled(!calendarLogic.canMoveNextMonth())
            }
            .padding(.horizontal)
            
            
            Spacer()
         }
         .padding(.horizontal)
         .padding(.bottom, 8)
         
         HStack {
            ForEach(weekSymbols, id: \.self) { symbol in
               Text(symbol)
                  .foregroundStyle(.gray)
                  .frame(maxWidth: .infinity)
            }
         }
         .padding(.horizontal)
         .padding(.bottom, 16)
      }
   }
}

fileprivate struct CalendarGrid: View {
   @ObservedObject fileprivate var calendarLogic: CalendarViewLogic
   
   var body: some View {
      
      LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
         let firstWeekDay = calendarLogic.getFirstWeekDay(in: calendarLogic.month)
         let totalDays = calendarLogic.getTotalDays(in: calendarLogic.month)
         ForEach( -firstWeekDay ..< totalDays, id: \.self) { index in
            let date = calendarLogic.getDate(for: index)
            let day = Calendar.current.component(.day, from: date)
            let isClicked = calendarLogic.tappedDate == date
            let isToday = calendarLogic.isToday(for: date)
            
            CalendarGridCell(day: day, isClicked: isClicked, isToday: isToday)
               .onTapGesture {
                  if index >= 0 && index < totalDays {
                     calendarLogic.tappedDate = calendarLogic.getDate(for: index)
                  }
               }
         }
      }
   }
}

fileprivate struct CalendarGridCell: View {
   private let day: Int
   private var isClicked: Bool
   private let isToday: Bool
   private var isCurrentMonthDay: Bool
   
   private var foregroundColor: Color {
      if isClicked { return .white }
      else if isCurrentMonthDay { return .black }
      else { return .gray }
   }
   private var backgroundColor: Color {
      if isClicked { return .black }
      else if isToday { return .gray }
      else { return .clear }
   }
   
   
   fileprivate init(
      day: Int,
      isClicked: Bool = false,
      isToday: Bool = false,
      isCurrentMonthDay: Bool = true
   ) {
      self.day = day
      self.isClicked = isClicked
      self.isToday = isToday
      self.isCurrentMonthDay = isCurrentMonthDay
   }
   
   var body: some View {
      VStack {
         Circle()
            .fill(backgroundColor)
            .overlay(Text(String(day)))
            .foregroundStyle(foregroundColor)
         
         Spacer()
         
         if isClicked {
            Circle()
               .fill(.red)
               .frame(width: 10, height: 10)
         } else {
            Spacer().frame(height: 10)
         }
      }
      .frame(height: 50)
   }
}

#Preview {
   CalendarView(logic: .init())
}
