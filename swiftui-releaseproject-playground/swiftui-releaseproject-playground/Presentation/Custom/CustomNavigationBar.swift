//
//  CustomNavigationBar.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI

struct CustomNavigationBar: View {
   private var action: () -> Void
   private let title: String
   private let icon: String
   
   init(
      action: @escaping () -> Void,
      title: String,
      icon: String
   ) {
      self.action = action
      self.title = title
      self.icon = icon
   }
   
   var body: some View {
      HStack(alignment: .center) {
         Button {
            action()
         } label: {
            Image(systemName: icon)
               .resizable()
               .frame(width: 8.0, height: 12.0)
               .foregroundStyle(.baseBlack)
         }
         Spacer()
         
         Text(title)
            .byCustomFont(.satoshiMedium, size: 16.0)
            .foregroundStyle(.baseBlack)
            .offset(x: -8)
         
         Spacer()
      }
      .padding(.horizontal, 16.0)
      .padding(.vertical, 8.0)
      .frame(maxHeight: 56.0)
      .background(.white)
      .shadow(color: .grayMd, radius: 1, y: 0.5)
   }
}
