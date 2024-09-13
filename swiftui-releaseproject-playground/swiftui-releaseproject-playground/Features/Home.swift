//
//  Home.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

struct Home: View {
   var body: some View {
      VStack {
         Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
         Text("english?")
            .byCustomFont(.satoshiBold, size: 22)
      }
      .padding()
   }
}

#Preview {
   Home()
}
