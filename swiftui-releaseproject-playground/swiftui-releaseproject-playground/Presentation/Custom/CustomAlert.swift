//
//  CustomAlert.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI

import MijickPopupView

struct CustomAlert: CentrePopup {
   func createContent() -> some View {
      VStack(spacing: 0) {
         Text("Witaj okrutny świecie")
         Button(action: dismiss) { Text("확인") }
      }
      .padding(.vertical, 20)
      .padding(.leading, 24)
      .padding(.trailing, 16)
      .background(.grayMd)
   }
   
   func configurePopup(popup: CentrePopupConfig) -> CentrePopupConfig {
       popup.horizontalPadding(28)
   }
}

#Preview {
   CustomAlert()
}
