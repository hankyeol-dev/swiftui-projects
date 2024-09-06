//
//  Extension+View.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

extension View {
   func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
      return clipShape(RoundedCorner(radius: radius, corners: corners))
   }
}
