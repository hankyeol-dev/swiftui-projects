//
//  NavigatingWrapper.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/4/24.
//

import SwiftUI

struct NavigatingViewWrapper<V: View>: View {
   
   var navigatingContentHandler: () -> V
   
   var body: some View {
      navigatingContentHandler()
   }
   
   init(_ navigatingContentHandler: @autoclosure @escaping () -> V) {
      // @autoclosure -> 기존 중괄호 형태의 클로저가 아닌 init 호출처럼 클로저를 호출하게 해줌
      self.navigatingContentHandler = navigatingContentHandler
      print("NavigatingWrapper init")
   }
}
