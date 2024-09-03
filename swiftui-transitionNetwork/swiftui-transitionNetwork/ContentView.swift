//
//  ContentView.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/2/24.
//

/**
 SwitfUI, UIKit의 혼용도 가능하다.
 
 */

import SwiftUI

extension Color {
   static func random() -> Color {
      return Color(red: .random(in: 0...1),
                   green: .random(in: 0...1),
                   blue: .random(in: 0...1)
      )
   }
}

struct ContentView: View {
   var body: some View {
      VStack {
         Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
         Text("Hello, world!")
      }
      .padding()
   }
}

#Preview {
   ContentView()
}
