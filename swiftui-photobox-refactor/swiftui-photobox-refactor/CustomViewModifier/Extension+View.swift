//
//  Extension+View.swift
//  swiftui-photobox-refactor
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

extension View {
   func asCapsuledView(
      fontSize: CGFloat = 16,
      fontWeight: Font.Weight = .semibold,
      backgroundC: Color = .black,
      foregroundC: Color = .white,
      width: CGFloat = .infinity,
      height: CGFloat
   ) -> some View {
      return modifier(
         CapsuledView(
            fontSize: fontSize, fontWeight: fontWeight, backgroundC: backgroundC, foregroundC: foregroundC, width: width, height: height
         )
      )
   }
}
