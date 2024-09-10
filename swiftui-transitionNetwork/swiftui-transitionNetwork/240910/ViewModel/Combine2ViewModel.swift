//
//  Combine2ViewModel.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import Foundation

final class Combine2ViewModel: ObservableObject {
   @Published private var marketList: Markets = []
   
   func getMarketList() -> Markets { return marketList }
   
   func setMarketList() async {
      do {
         let markets = try await UpbitAPI.fetchAllMarket()
         marketList = markets
      } catch {
         dump(error)
         marketList = []
      }
   }
   func appendMarketList(_ market: Market) { marketList.append(market) }
   
   func removeMarket(_ market: Market) {
      if let index = marketList.firstIndex(of: market) {
         marketList.remove(at: index)
      }
   }
}
