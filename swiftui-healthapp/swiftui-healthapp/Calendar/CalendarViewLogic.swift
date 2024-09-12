//
//  CalendarViewLogic.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/11/24.
//

import Foundation

final class CalendarViewLogic: ObservableObject {
   @Published var month: Date = Date()
   @Published var tappedDate: Date?
   
   init(month: Date = Date(), tappedDate: Date? = nil) {
      self.month = month
      self.tappedDate = tappedDate
   }
   
   
   /// 선택된 날짜를 반환
   func getDate(for index: Int) -> Date {
      let calendar = Calendar.current
      guard let firstDay = calendar.date(
         from: .init(
            year: calendar.component(.year, from: month),
            month: calendar.component(.month, from: month),
            day: 1
         )
      ) else { return .init() }
      
      var components = DateComponents()
      components.day = index
      
      let timeZone = TimeZone.current
      let offset = Double(timeZone.secondsFromGMT(for: firstDay))
      components.second = Int(offset)
      
      return calendar.date(byAdding: components, to: firstDay) ?? .now
   }
   
   /// 특정 달에 몇 일이 있는지 반환
   func getTotalDays(in date: Date) -> Int {
      return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
   }
   
   func getFirstWeekDay(in date: Date) -> Int {
      let components = Calendar.current.dateComponents([.year, .month], from: date)
      let firstWeekDay = Calendar.current.date(from: components)!
      return Calendar.current.component(.weekday, from: firstWeekDay)
   }
   
   func getLastDayOfPreviousMonth() -> Date {
      let components = Calendar.current.dateComponents([.year, .month], from: month)
      let firstDay = Calendar.current.date(from: components)!
      return Calendar.current.date(byAdding: .month, value: -1, to: firstDay)!
   }
   
   func switchMonth(for value: Int) -> Date {
      if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: month) {
         return newMonth
      } else { return month }
   }
   
   func switchCurrentMonth(by value: Int) { month = switchMonth(for: value) }
   
   func canMovePreviousMonth() -> Bool {
      let current = Date()
      let targetMonth = Calendar.current.date(byAdding: .month, value: -3, to: current) ?? current
      
      return switchMonth(for: -1) >= targetMonth
   }
   
   func canMoveNextMonth() -> Bool {
      let current = Date()
      let targetMonth = Calendar.current.date(byAdding: .month, value: 3, to: current) ?? current
      
      return switchMonth(for: 1) <= targetMonth
   }
}

extension CalendarViewLogic {
   func currentMonthFormatter() -> DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY년 MM월"
      return formatter
   }
   
   func isToday(for date: Date) -> Bool {
      let today = Date()
      let compare = Calendar.current.dateComponents([.month, .day], from: date, to: today)
      return compare.day == 0
   }
}
