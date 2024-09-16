//
//  Home.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

struct Home: View {
   @StateObject private var realmManager: RealmManager = .manager
   @State private var selectedTabIndex: Int = 1
   @State private var presentSubjectView: Bool = false
   
   var body: some View {
      NavigationView {
         VStack {
            ZStack {
               if selectedTabIndex == 1 {
                  ButtonList()
                     .environmentObject(realmManager)
               }
            }
            
            Spacer()
            
            CustomTabbar(selectedTabIndex: $selectedTabIndex, isPresendSubjectView: $presentSubjectView)
         }
      }
   }
}


#Preview {
   Home()
}
