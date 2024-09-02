//
//  CapsuledView.swift
//  swiftui-photobox-refactor
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct CapsuledView: ViewModifier {
   internal var fontSize: CGFloat
   internal var fontWeight: Font.Weight
   internal var backgroundC: Color
   internal var foregroundC: Color
   internal var width: CGFloat = .infinity
   internal var height: CGFloat
   
   func body(content: Content) -> some View {
      return content
         .frame(width: width, height: height)
         .padding(.all, 8)
         .background(backgroundC)
         .foregroundStyle(foregroundC)
         .clipShape(.capsule)
   }
}
