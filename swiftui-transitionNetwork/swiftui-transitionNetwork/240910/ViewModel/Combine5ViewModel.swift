//
//  Combine5ViewModel.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import Foundation
import Combine

protocol CombineViewModelPR: ObservableObject {
   associatedtype Input
   associatedtype Output

   var cancellable: Set<AnyCancellable> { get set }
   var input: Input { get set }
   var output: Output { get set }
   
   func transform()
}

final class Combine5ViewModel: CombineViewModelPR {
   var cancellable = Set<AnyCancellable>()
   @Published var input = Input()
   @Published var output = Output()
   
   enum Combine3Errors: Error {
      case networkError
   }
   
   struct Input {
      let didOnTask = PassthroughSubject<Void, Combine3Errors>() // error type도 지정해줘야 함
   }
   
   struct Output {
      var didOnTaskOutput: Markets = []
   }
   
   init() {
      transform()
   }
   
   func transform() {
      input
         .didOnTask
         .sink { error in
            dump(error)
         } receiveValue: { [weak self] void in
            guard let self else { return }
            Task {
               await self.setMarketList()
            }
         }
         .store(in: &cancellable)
   }
   
   private func setMarketList() async {
      do {
         let markets = try await UpbitAPI.fetchAllMarket()
         output.didOnTaskOutput = markets
      } catch {
         output.didOnTaskOutput = []
      }
   }
}

extension Combine5ViewModel {
   // 알아서~
   enum Action {
      case didOnTask
   }
   
   func action(_ action: Action) {
      switch action {
      case .didOnTask:
         input.didOnTask.send(())
      }
   }
}
