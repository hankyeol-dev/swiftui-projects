//
//  +Style.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI

struct CustomGroupBoxStyle: GroupBoxStyle {
   private var labelFont: Text.CustomFont
   private var labelColor: Color
   private var hSpacing: CGFloat
   private var vSpacing: CGFloat
   private var radius: CGFloat
   
   init(
      labelFont: Text.CustomFont = .kjcBold,
      labelColor: Color = .baseBlack,
      hSpacing: CGFloat = 12.0,
      vSpacing: CGFloat = 8.0,
      radius: CGFloat = 12.0
   ) {
      self.labelFont = labelFont
      self.labelColor = labelColor
      self.hSpacing = hSpacing
      self.vSpacing = vSpacing
      self.radius = radius
   }
   
   func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .leading) {
         configuration.label
            .font(.custom(labelFont.rawValue, size: 15))
            .foregroundStyle(labelColor)
         
         configuration.content
      }
      .padding(.horizontal, hSpacing)
      .padding(.vertical, vSpacing)
      .background(.regularMaterial, in: RoundedRectangle(cornerRadius: radius))
   }
}

extension GroupBoxStyle where Self == CustomGroupBoxStyle {
   static func customGroupBox(
      labelFont: Text.CustomFont = .kjcBold,
      labelColor: Color = .baseBlack,
      hSpacing: CGFloat = 12.0,
      vSpacing: CGFloat = 8.0,
      radius: CGFloat = 12.0
   ) -> CustomGroupBoxStyle {
      CustomGroupBoxStyle(
         labelFont: labelFont,
         labelColor: labelColor,
         hSpacing: hSpacing,
         vSpacing: vSpacing,
         radius: radius
      )
   }
}
