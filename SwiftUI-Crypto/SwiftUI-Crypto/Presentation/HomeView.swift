//
//  HomeView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/8/24.
//

import SwiftUI

enum Tab {
   case Trending
   case Search
   case Favorite
}


struct HomeView: View {
   
   var body: some View {
      TabView {
         TrendingView()
            .tabItem { Image(systemName: "chart.line.uptrend.xyaxis") }
            .tag(Tab.Trending)
         
         SearchView()
            .tabItem { Image(systemName: "magnifyingglass") }
            .tag(Tab.Search)
         
         FavoriteView()
            .tabItem { Image(systemName: "creditcard.fill") }
            .tag(Tab.Favorite)
      }
   }
}
