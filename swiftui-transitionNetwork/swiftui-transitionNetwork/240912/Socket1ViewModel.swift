//
//  Socket1ViewModel.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import Foundation
import Combine

final class Socket1ViewModel: ObservableObject {
   private var cancellable = Set<AnyCancellable>()
   private let socketManager: SocketManager = .manager
   
   @Published var bidOrderbooks: [OrderbookItem] = []
   @Published var askOrderbooks: [OrderbookItem] = []
   
   func getOrderbook() {
      socketManager.open()
      socketManager.send()
      socketManager.orderbookSubject
         .sink { [weak self] orderbook in
            DispatchQueue.main.async {
               self?.bidOrderbooks = orderbook.convertToBidOrderbookItem
               self?.askOrderbooks = orderbook.convertToAskOrderbookItem
            }
         }
         .store(in: &cancellable)
   }
   
   func stop() {
      socketManager.close()
   }
   
   deinit {
      socketManager.close()
   }
}
