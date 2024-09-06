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
          Text("first tab")
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .background(.cyan)
             .tabItem { Label("First", systemImage: "1.circle") }
          Text("second tab")
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .background(.yellow)
             .tabItem { Image(systemName: "apple.logo") }
       }
    }
}

#Preview {
    ContentView()
}
