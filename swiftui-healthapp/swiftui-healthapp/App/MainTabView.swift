//
//  MainTabView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

enum TabType: String {
   case home
   case calendar
}

struct MainTabView: View {
   @State private var selectedTab: TabType = .calendar
   
   var body: some View {
      TabView(selection: $selectedTab) {
         CalendarView(logic: .init())
            .tag(TabType.calendar)
            .tabItem { Image(systemName: "calendar") }
         HomeView()
            .tag(TabType.home)
            .tabItem { Image(systemName: "house") }
      }
   }
}

#Preview {
   MainTabView()
}
