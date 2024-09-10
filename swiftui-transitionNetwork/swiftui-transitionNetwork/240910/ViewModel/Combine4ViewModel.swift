//
//  Combine4ViewModel.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import Foundation
import Combine

final class Combine4ViewModel: ObservableObject {
   private var cancellable = Set<AnyCancellable>()

   @Published var input = Input()
   @Published var output = Output()
   
   enum Action {
      case feed
      case emit
   }
   
   struct Input {
      let feedButtonTapped = PassthroughSubject<Void, Never>()
      let emitButtonTapped = PassthroughSubject<Void, Never>()
      var fieldText: String = ""
      var fieldText2: String = ""
   }
   
   struct Output {
      var bob: Int = 0
      var mul: Int = 0
   }
   
   init() {
      input
         .feedButtonTapped
         .sink { [weak self] void in
            guard let self else { return }
            self.eating()
         }
         .store(in: &cancellable)
      
      input
         .emitButtonTapped
         .sink { [weak self] void in
            guard let self else { return }
            self.emitting()
         }
         .store(in: &cancellable)
   }
   
   private func eating() {
      if input.fieldText.isEmpty && input.fieldText2.isEmpty {
         output.bob += 1
         output.mul += 1
      } else {
         if let bobCount = Int(input.fieldText) {
            output.bob += bobCount
         }
         
         if let mulCount = Int(input.fieldText2) {
            output.mul += mulCount
         }
         input.fieldText = ""
         input.fieldText2 = ""
      }
   }
   private func emitting() {
      if input.fieldText.isEmpty && input.fieldText2.isEmpty && output.bob > 0 && output.mul > 0 {
         output.bob -= 1
         output.mul -= 1
      } else {
         if let bobCount = Int(input.fieldText) {
            output.bob -= bobCount
         }
         
         if let mulCount = Int(input.fieldText2) {
            output.mul -= mulCount
         }
         
         input.fieldText = ""
         input.fieldText2 = ""
      }
   }
   
   func action(_ action: Action) {
      switch action {
      case .feed:
         input.feedButtonTapped.send(())
      case .emit:
         input.emitButtonTapped.send(())
      }
   }
}
