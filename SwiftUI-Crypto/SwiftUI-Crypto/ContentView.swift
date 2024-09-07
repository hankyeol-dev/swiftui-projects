//
//  ContentView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
          TrendingView()
             .tabItem { Image(systemName: "chart.line.uptrend.xyaxis") }
          FavoriteView()
             .tabItem { Image(systemName: "creditcard.fill") }
       }
       .background(.white)
    }
}

#Preview {
    ContentView()
}
