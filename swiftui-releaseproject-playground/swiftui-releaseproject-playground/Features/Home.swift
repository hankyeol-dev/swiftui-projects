//
//  Home.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

struct Home: View {
   @State private var selectedTabIndex: Int = 1
   @State private var presentSubjectView: Bool = false
   
   var body: some View {
      NavigationView {
         VStack {
            ZStack {
               
//               if selectedTabIndex == 2 {
//                  SubjectSelectionView()
//               }
            }
            
            Spacer()
            NavigationLink {
               if selectedTabIndex == 2 {
                  SubjectSelectionView()
               }
            } label: {
               CustomTabbar(selectedTabIndex: $selectedTabIndex, isPresendSubjectView: $presentSubjectView)
            }
         }
      }
   }
}

struct SubjectSelectionView: View {
   @Environment(\.dismiss) private var dismiss
   
   var body: some View {
      VStack {
         CustomNavigationBar(action: dismissView, title: "사유 주제 선택", icon: "chevron.left")
         
         ScrollView {
            VStack {
               Text("주제를 선택해보세요.")
            }
         }
      }
   }
   
   private func dismissView() { dismiss() }
}

#Preview {
   Home()
}
