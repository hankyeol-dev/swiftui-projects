//
//  CalendarViewLibrary.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/11/24.
//

import SwiftUI
import MijickCalendarView

struct CalendarViewLibrary: View {
   @State private var selectedDate: Date? = .now
   @State private var selectedRange: MDateRange? = .init()
   
   var body: some View {
      VStack {
         Spacer.height(40.0)
         MCalendarView(selectedDate: $selectedDate, selectedRange: $selectedRange) { config in
            config
               .startMonth(.now)
               .endMonth(.now)
         }
      }
   }
}

#Preview {
   CalendarViewLibrary()
}

extension Spacer {
   @ViewBuilder static func width(_ value: CGFloat?) -> some View {
      switch value {
      case .some(let value): Spacer().frame(width: max(value, 0))
      case nil: Spacer()
      }
   }
   @ViewBuilder static func height(_ value: CGFloat?) -> some View {
      switch value {
      case .some(let value): Spacer().frame(height: max(value, 0))
      case nil: Spacer()
      }
   }
}
