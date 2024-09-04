//
//  ObservableObject1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/4/24.
//

import Foundation

final class SomeObservableObject: ObservableObject {
   @Published var name: String
   
   init(name: String) {
      self.name = name
   }
}
