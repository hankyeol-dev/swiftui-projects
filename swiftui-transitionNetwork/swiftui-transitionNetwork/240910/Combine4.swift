//
//  Combine4.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import SwiftUI

struct Combine4: View {
   @StateObject fileprivate var viewModel: Combine4ViewModel
   
   var body: some View {
      VStack(alignment: .leading) {
         Text("밥알 \(viewModel.output.bob)개\n물방울 \(viewModel.output.mul)개")
         TextField("밥알", text: $viewModel.input.fieldText)
         TextField("물방울", text: $viewModel.input.fieldText2)
         Button {
            viewModel.action(.feed)
//            viewModel.input.feedButtonTapped.send(())
         } label: { Text("밥 맥이기") }
         Button {
            viewModel.action(.emit)
//            viewModel.input.emitButtonTapped.send(())
         } label: { Text("배설하기") }
      }
      .padding(.horizontal, 36)
   }
}

#Preview {
   Combine4(viewModel: .init())
}
