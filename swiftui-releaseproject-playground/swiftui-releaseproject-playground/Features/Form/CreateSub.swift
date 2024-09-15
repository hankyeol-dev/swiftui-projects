//
//  CreateSub.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/15/24.
//

import SwiftUI

import RealmSwift

struct CreateSub: View {
   @Environment(\.dismiss) private var dismiss
   
   private let subject: String
   
   @ObservedResults(Sub.self)
   private var subObject
   
   init(subject: String) {
      self.subject = subject
   }
   
   var body: some View {
      NavigationView {
         VStack {
            CustomNavigationBar(action: dismissView, title: "사유하기", icon: "chevron.left")
            ScrollView {
               GroupBox {
                  asRoundedButton(
                     title: subject,
                     radius: 16.0,
                     background: .baseBlack,
                     foreground: .white,
                     height: 36,
                     fontSize: 16.0,
                     font: .kjcRegular)
               } label: {
                  Text("오늘의 사유 주제")
               }
               .groupBoxStyle(.customGroupBox(
                  labelFont: .kjcRegular,
                  labelColor: .baseBlack.opacity(0.8),
                  hSpacing: 16.0,
                  vSpacing: 12.0,
                  radius: 16.0))
               
               GroupBox {
                  
               } label: {
                  Text("")
               }
            }
         }
         .padding()
      }
   }
   
   private func dismissView() {
      dismiss()
   }
}

#Preview {
   CreateSub(subject: "주제")
}
