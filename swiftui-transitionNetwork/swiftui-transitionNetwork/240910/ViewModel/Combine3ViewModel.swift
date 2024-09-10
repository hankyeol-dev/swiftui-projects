//
//  Combine3ViewModel.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import Foundation
import Combine

/**
 RxSwift (classType, RxCocoa, Value Type) - Combine (pr, X, Value + Error Type)
 - Observable - Publisher
 - Observer - Subscriber
 - subscribe - sink
 - bind/drive -
 - subject - passthroughSubject, currentValueSubject
 - dispose, disposeBag - store, AnyCancellable (pr)
 */
final class Combine3ViewModel: ObservableObject {
   // cancellable
   private var cancellable = Set<AnyCancellable>()
   var input = Input()
   @Published var output = Output()
   
   enum Combine3Errors: Error {
      case networkError
   }
   
   struct Input {
      let didOnTask = PassthroughSubject<Void, Combine3Errors>() // error type도 지정해줘야 함
   }
   
   struct Output {
      let didOnTaskOutput = CurrentValueSubject<Markets, Combine3Errors>([])
   }
   
   init() {
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
   
   private func getMarketList() -> Markets { return output.didOnTaskOutput.value }
   private func setMarketList() async {
      do {
         let markets = try await UpbitAPI.fetchAllMarket()
         output.didOnTaskOutput.value = markets
      } catch {
         dump(error)
         output.didOnTaskOutput.value = []
      }
   }
}
