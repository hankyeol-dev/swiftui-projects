//
//  HomeView.swift
//  swiftui-play
//
//  Created by 강한결 on 9/11/24.
//

import SwiftUI

struct HomeView: View {
   var body: some View {
      MapViewRepresentable()
         .ignoresSafeArea()
   }
}

#Preview {
   HomeView()
}
