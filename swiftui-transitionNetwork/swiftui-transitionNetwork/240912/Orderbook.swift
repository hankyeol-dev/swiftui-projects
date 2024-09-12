//
//  Orderbook.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import Foundation

struct OrderBook: Hashable, Decodable {
   
   // let market: String
   let timestamp: Int
   let total_ask_size: Double
   let total_bid_size: Double
   let orderbook_units: [OrderbookUnit]
   
   var convertToAskOrderbookItem: [OrderbookItem] {
      orderbook_units.map {
         return .init(price: $0.ask_price, size: $0.ask_size)
      }.sorted { $0.price > $1.price }
   }
   
   var convertToBidOrderbookItem: [OrderbookItem] {
      orderbook_units.map {
         return .init(price: $0.bid_price, size: $0.bid_size)
      }.sorted { $0.price > $1.price }
   }
}

struct OrderbookUnit: Hashable, Decodable {
   let ask_price, ask_size: Double
   let bid_price, bid_size: Double
}

struct OrderbookItem: Hashable, Identifiable {
   let id: UUID = .init()
   let price: Double
   let size: Double
}
