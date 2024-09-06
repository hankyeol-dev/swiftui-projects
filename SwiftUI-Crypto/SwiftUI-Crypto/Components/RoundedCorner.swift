//
//  RoundedCorner.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct RoundedCorner: Shape {
   var radius: CGFloat = .infinity
   var corners: UIRectCorner = .allCorners
   
   func path(in rect: CGRect) -> Path {
      let path = UIBezierPath(
         roundedRect: rect,
         byRoundingCorners: corners,
         cornerRadii: .init(width: radius, height: radius)
      )
      return Path(path.cgPath)
   }
}
