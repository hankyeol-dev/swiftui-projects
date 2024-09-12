//
//  +View.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI

extension View {
   @ViewBuilder
   func hSpacing(_ alignment: Alignment) -> some View {
      self.frame(maxWidth: .infinity, alignment: alignment)
   }
   
   @ViewBuilder
   func vSpacing(_ alignment: Alignment) -> some View {
      self.frame(maxHeight: .infinity, alignment: alignment)
   }
   
   func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
      return Calendar.current.isDate(date1, inSameDayAs: date2)
   }
}
