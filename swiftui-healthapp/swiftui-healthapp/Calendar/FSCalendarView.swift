//
//  FSCalendarView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/11/24.
//

import SwiftUI
import FSCalendar

struct FSCalendarView: View {
    var body: some View {
        FSCalendars()
          .frame(width: .infinity, height: 450)
    }
}

#Preview {
    FSCalendarView()
}

struct FSCalendars: UIViewRepresentable {
   typealias UIViewType = FSCalendar
   
   func makeUIView(context: Context) -> FSCalendar {
      let calendar = FSCalendar()
      calendar.delegate = context.coordinator
      calendar.dataSource = context.coordinator
      calendar.locale = .init(identifier: "ko_KR")
      let appearance = calendar.appearance
      appearance.headerDateFormat = "YYYY년 MM월"
      appearance.weekdayTextColor = .black
      appearance.headerMinimumDissolvedAlpha = 0.0
      return calendar
   }
   
   func updateUIView(_ uiView: FSCalendar, context: Context) {}
   func makeCoordinator() -> Coordinator {
      return Coordinator()
   }
}

extension FSCalendars {
   class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
      
   }
}
