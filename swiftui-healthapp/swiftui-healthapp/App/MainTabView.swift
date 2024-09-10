//
//  MainTabView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

enum TabType: String {
   case home
   case chart
}

struct MainTabView: View {
   @State private var selectedTab: TabType = .home
   
   var body: some View {
      TabView(selection: $selectedTab) {
         HomeView()
            .tag(TabType.home)
            .tabItem { Image(systemName: "house") }
         
         HistoricDataView()
            .tag(TabType.chart)
            .tabItem { Image(systemName: "chart.line.uptrend.xyaxis") }
      }
   }
}

#Preview {
   MainTabView()
}
