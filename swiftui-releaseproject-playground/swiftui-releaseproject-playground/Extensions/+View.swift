//
//  +View.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI

extension View {
   func asRoundedButton(
      title: String,
      radius: CGFloat = 12.0,
      background: Color = .baseBlack,
      foreground: Color = .white,
      height: CGFloat = 44.0,
      fontSize: CGFloat = 16.0,
      font: Text.CustomFont = .satoshiRegular
   ) -> some View {
      return self.modifier(AsRoundedButton(
         title: title,
         radius: radius,
         background: background,
         foreground: foreground,
         height: height,
         fontSize: fontSize,
         font: font)
      )
   }
}
