//
//  Observable3.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

struct Observable3: View {
   
   @ObservedObject fileprivate var viewModel: Observable3ViewModel
   
   var body: some View {
      VStack(alignment: .leading) {
         Text("밥알 \(viewModel.bob)개\n물방울 \(viewModel.mul)개")
         TextField("밥알", text: $viewModel.fieldText)
         TextField("물방울", text: $viewModel.fieldText2)
         Button {
            viewModel.eating()
         } label: { Text("밥 맥이기") }
         Button {
            viewModel.emitting()
         } label: { Text("배설하기") }
      }
      .padding(.horizontal, 36)
   }
}

struct Observable3MainView: View {
   @ObservedObject private var viewModel = Observable3ViewModel()
   @State private var random: Int = 0
   
   var body: some View {
      VStack {
         Text("\(random)")
         Button { random = Int.random(in: 0...13) } label: { Text("랜덤") }
         Text("Tamagochi")
            .font(.title)
            .bold()
            .padding()
         Observable3(viewModel: viewModel)
      }
      
   }
}

final fileprivate class Observable3ViewModel: ObservableObject {
   @Published var fieldText: String = ""
   @Published var fieldText2: String = ""
   @Published var bob: Int = 0
   @Published var mul: Int = 0
   
   init() { print("뷰모델 init") }
   
   func eating() {
      if fieldText.isEmpty && fieldText2.isEmpty {
         bob += 1
         mul += 1
      } else {
         if let bobCount = Int(fieldText) {
            bob += bobCount
         }
         
         if let mulCount = Int(fieldText2) {
            mul += mulCount
         }
         
         fieldText = ""
         fieldText2 = ""
      }
   }
   
   func emitting() {
      if fieldText.isEmpty && fieldText2.isEmpty && bob > 0 && mul > 0 {
         bob -= 1
         mul -= 1
      } else {
         if let bobCount = Int(fieldText) {
            bob -= bobCount
         }
         
         if let mulCount = Int(fieldText2) {
            mul -= mulCount
         }
         
         fieldText = ""
         fieldText2 = ""
      }
   }
}

#Preview {
    Observable3MainView()
}
