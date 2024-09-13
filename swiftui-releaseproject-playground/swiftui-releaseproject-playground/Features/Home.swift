//
//  Home.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

struct Home: View {
   @State private var selectedTabIndex: Int = 1
   
   var body: some View {
      CustomTabbar(selectedTabIndex: $selectedTabIndex)
   }
}

struct CustomTabbar: View {
   @Binding fileprivate var selectedTabIndex: Int
   @Namespace fileprivate var animation
   
   enum TabIcons: Int, CaseIterable {
      case sayu = 1
      case plus
      case chart
      
      var byUnselected: Image {
         switch self {
         case .chart:
               .init(.chartUnSelected)
         case .plus:
               .init(.plusUnSelected)
         case .sayu:
               .init(.sayuUnSelected)
         }
      }
      
      var bySelected: Image {
         switch self {
         case .chart:
               .init(.chartSelected)
         case .plus:
               .init(.plusSelected)
         case .sayu:
               .init(.sayuSelected)
         }
      }
   }
   
   var body: some View {
      VStack {
         ZStack {
            // View Area
         }
         
         Spacer()
         
         HStack(alignment: .center) {
            ForEach(TabIcons.allCases, id: \.self.rawValue) { tab in
               Spacer()
               
               Button {
                  selectedTabIndex = tab.rawValue
               } label: {
                  if selectedTabIndex == tab.rawValue {
                     tab.bySelected
                        .offset(y: tab.rawValue == 2 ? -24 : 0)
                  } else {
                     tab.byUnselected
                        .offset(y: tab.rawValue == 2 ? -24 : 0)
                  }
               }
               
               Spacer()
            }
         }
         .padding(.top, 16)
         .frame(maxWidth: .infinity, maxHeight: 48)
         .background(.graySm.opacity(0.5))
         .shadow(color: .grayMd.opacity(0.2), radius: 3, y: -1.0)
         .ignoresSafeArea()
      }
   }
}

struct TabOneView: View {
   var body: some View {
      RoundedRectangle(cornerRadius: 24)
   }
}

#Preview {
   Home()
}
