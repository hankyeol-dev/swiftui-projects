//
//  CustomTabbar.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI

struct CustomTabbar: View {
   @Binding var selectedTabIndex: Int
   @Binding var isPresendSubjectView: Bool
   
   private enum TabIcons: Int, CaseIterable {
      case calendar = 1
      case plus
      case chart
      
      var byUnselected: Image {
         switch self {
         case .chart:
               .init(.chartUnSelected)
         case .plus:
               .init(.plusSelected)
         case .calendar:
               .init(.calendarUnselected)
         }
      }
      
      var bySelected: Image {
         switch self {
         case .chart:
               .init(.chartSelected)
         case .plus:
               .init(.plusSelected)
         case .calendar:
               .init(.calendarSelected)
         }
      }
   }
   
   var body: some View {
      HStack(alignment: .center) {
         ForEach(TabIcons.allCases, id: \.self.rawValue) { tab in
            Spacer()
            
            if tab.rawValue == 2 {
               Button {
                  selectedTabIndex = tab.rawValue
                  isPresendSubjectView = true
               } label: {
                  tab.bySelected
                     .resizable()
                     .frame(width: 36, height: 36)
               }
               .fullScreenCover(isPresented: $isPresendSubjectView) {
                  SubjectSelectionView()
               }
            } else {
               Button {
                  selectedTabIndex = tab.rawValue
               } label: {
                  if selectedTabIndex == tab.rawValue {
                     tab.bySelected
                        .resizable()
                        .frame(width: 32, height: 32)
                  } else {
                     tab.byUnselected
                        .resizable()
                        .frame(width: 32, height: 32)
                  }
               }
            }
            
            Spacer()
         }
      }
      .padding(.vertical, 16)
      .frame(maxWidth: .infinity, maxHeight: 56)
      .background(.white)
      .shadow(color: .grayMd, radius: 1, y: -0.5)
      .ignoresSafeArea()
   }
}

#Preview {
   CustomTabbar(selectedTabIndex: .constant(1), isPresendSubjectView: .constant(false))
}
