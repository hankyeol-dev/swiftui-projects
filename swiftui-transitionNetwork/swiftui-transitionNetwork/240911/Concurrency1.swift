//
//  Concurrency1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/11/24.
//

import SwiftUI

struct Concurrency1: View {
   
   @State private var count = 0
   
   var body: some View {
      Concurrency1VCWrapper()
   }
}

#Preview {
   Concurrency1()
}
