//
//  Crypto.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import Foundation

struct TrendingListViewItem: Hashable {
   let coin_id: String
   let image: String
   let name: String
   let symbol: String
   let price: Double
   let priceChangePercent: Double
}

struct TrendingOutputs {
   let coins: [CoinItem]
   let nfts: [NftItem]
   
   var coinsToTrendingListViewItems: [TrendingListViewItem] {
      return coins.map { .init(coin_id: $0.id, image: $0.small, name: $0.name, symbol: $0.symbol, price: $0.data.roundedPrice, priceChangePercent: $0.data.roundedChangePercent) }
   }
   
   var nftsToTrendingListViewItems: [TrendingListViewItem] {
      return nfts.map { .init(coin_id: $0.id, image: $0.thumb, name: $0.name, symbol: $0.symbol, price: $0.data.roundedPrice, priceChangePercent: $0.data.roundedChangePercent) }
   }
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
      case priceChangePercent = "price_change_percentge_24h"
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
   let thumb: String
   let data: NftItemData
}

struct NftItemData: Hashable, Decodable {
   let floorPrice: String
   let floorPriceChangePercent: String
   
   enum CodingKeys: String, CodingKey {
      case floorPrice = "floor_price"
      case floorPriceChangePercent = "floorPrice_in_usd_24h_percentage_change"
   }
   
   var roundedPrice: Double {
      if let price = Double(floorPrice) {
         return round(price * 100) / 100
      } else {
         return 0.0
      }
   }
   
   var roundedChangePercent: Double {
      if let percent = Double(floorPriceChangePercent) {
         return round(percent * 100) / 100
      } else {
         return 0.0
      }
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
