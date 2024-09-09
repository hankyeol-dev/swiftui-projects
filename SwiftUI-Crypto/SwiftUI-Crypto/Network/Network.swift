//
//  Network.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/9/24.
//

import Foundation

struct Network {
   static func getTrending() async throws -> TrendingOutputs {
      if let url = URL(string: "https://api.coingecko.com/api/v3/search/trending") {
         return try await Network.request(url, of: TrendingOutputs.self)
      } else {
         throw NSError(domain: "invalid url", code: 3)
      }
   }
   
   static func searchCoin(_ coin: String) async throws -> SearchedCoinItems {
      if let url = URL(string: "https://api.coingecko.com/api/v3/search?query=\(coin)") {
         return try await Network.request(url, of: SearchedCoinItems.self)
      } else {
         throw NSError(domain: "invalid url", code: 3)
      }
   }
   
   private static func request<D: Decodable>(_ url: URL, of: D.Type) async throws -> D {
      let request = URLRequest(url: url)
      
      do {
         let (data, response) = try await URLSession.shared.data(for: request)
         
         if let res = response as? HTTPURLResponse, (200..<300).contains(res.statusCode) {
            return try JSONDecoder().decode(D.self, from: data)
         } else {
            throw NSError(domain: "data not found", code: 2)
         }
         
      } catch {
         dump(error)
         throw NSError(domain: "error", code: 1)
      }
   }
}
