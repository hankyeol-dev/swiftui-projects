//
//  +Font.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import UIKit
import SwiftUI

extension Text {
   enum CustomFont: String {
      case hss = "HSSaemaul"
      case gmlight = "GmarketSansTTFLight"
      case gmMedium = "GmarketSansTTFMedium"
      case gmBold = "GmarketSansTTFBold"
      case kjcRegular = "KimjungchulMyungjo-Regular"
      case kjcBold = "KimjungchulMyungjo-Bold"
      case satoshiLight = "SatoshiVariable-Bold_Light"
      case satoshiRegular = "SatoshiVariable-Bold_Regular"
      case satoshiMedium = "SatoshiVariable-Bold_Medium"
      case satoshiBold = "SatoshiVariable-Bold_Bold"
   }
   
   func byCustomFont(_ customFont: CustomFont, size: CGFloat) -> Text {
      self.font(.custom(customFont.rawValue, size: size))
   }
}
