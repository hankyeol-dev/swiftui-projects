//
//  +Date.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import Foundation

extension Date {
   static func updateHour(_ value: Int) -> Date {
      let calendar = Calendar.current
      return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
   }
   
   func formatedDate(_ format: String) -> String {
      let formatter = DateFormatter()
      formatter.dateFormat = format
      formatter.locale = .init(identifier: "ko_KR")
      return formatter.string(from: self)
   }
   
   func isToday() -> Bool {
      return Calendar.current.isDateInToday(self)
   }
   
   struct WeekdayItem: Identifiable {
      let id: UUID = .init()
      var date: Date
   }
   
   func getWeekDay(_ date: Date = .init()) -> [WeekdayItem] {
      let calendar = Calendar.current
      let startDate = calendar.startOfDay(for: date)
      
      var weekItems: [WeekdayItem] = []
      
      let weekDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
      guard let startWeek = weekDate?.start else { return [] }
      
      (0..<7).forEach { index in
         if let weekDay = calendar.date(byAdding: .day, value: index, to: startDate) {
            weekItems.append(.init(date: weekDay))
         }
      }
      
      return weekItems
   }
}
