//
//  Crypto.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import Foundation
import SwiftUI

struct TrendingListViewItem: Hashable {
   let coin_id: String
   let image: String
   let name: String
   let symbol: String
   let price: Double
   let priceChangePercent: Double
}

struct TrendingOutputs: Decodable {
   var coins: [CoinItemItem]
   var nfts: [NftItem]
   
   var coinsToTrendingListViewItems: [TrendingListViewItem] {
      return coins.map { .init(
         coin_id: $0.item.id,
         image: $0.item.small,
         name: $0.item.name,
         symbol: $0.item.symbol,
         price: $0.item.data.roundedPrice,
         priceChangePercent: $0.item.data.roundedChangePercent) }
   }
   
   var nftsToTrendingListViewItems: [TrendingListViewItem] {
      return nfts.map { .init(
         coin_id: $0.id,
         image: $0.small,
         name: $0.name,
         symbol: $0.symbol,
         price: $0.roundedPrice,
         priceChangePercent: $0.roundedChangePercent) }
   }
}

struct CoinItemItem: Hashable, Decodable {
   let item: CoinItem
}

struct CoinItem: Hashable, Decodable {
   let id: String
   let coin_id: Int
   let name: String
   let symbol: String
   let marketRank: Int
   let small: String
   let data: CoinItemData
   
   enum CodingKeys: String,CodingKey {
      case id
      case coin_id
      case name
      case symbol
      case marketRank = "market_cap_rank"
      case small
      case data
   }
}

struct CoinItemData: Hashable, Decodable {
   let price: Double
   let priceChangePercent: CoinItemPercentage
   
   enum CodingKeys: String, CodingKey {
      case price
      case priceChangePercent = "price_change_percentage_24h"
   }
   
   var roundedPrice: Double {
      return round(price * 100) / 100
   }
   
   var roundedChangePercent: Double {
      return round(priceChangePercent.usd * 100) / 100
   }
}

struct CoinItemPercentage: Hashable, Decodable {
   let usd: Double
}

struct NftItem: Hashable, Decodable {
   let id: String
   let name: String
   let symbol: String
   let small: String
   let floorPrice: Double
   let floorPriceChangePercent: Double
   
   enum CodingKeys: String, CodingKey {
      case id
      case name
      case symbol
      case small = "thumb"
      case floorPrice = "floor_price_in_native_currency"
      case floorPriceChangePercent = "floor_price_24h_percentage_change"
   }
   
   var roundedPrice: Double {
      return round(floorPrice * 100) / 100
   }
   
   var roundedChangePercent: Double {
      return round(floorPriceChangePercent * 100) / 100
   }
}

struct SearchedCoinItem: Hashable, Decodable {
   let id: String
   let name: String
   let symbol: String
   let thumb: String
}

struct SearchedCoinItems: Hashable, Decodable {
   let coins: [SearchedCoinItem]
}
