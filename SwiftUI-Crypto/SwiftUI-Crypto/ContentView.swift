//
//  ContentView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

final class FavoriteObject: ObservableObject {
   @Published var favoriteCoinList: [CoinItem] = []
   
   init(
      favoriteCoinList: [CoinItem] = []
   ) {
      self.favoriteCoinList = favoriteCoinList
   }
   
   func appendCoin(_ coin: CoinItem) {
      favoriteCoinList.append(coin)
   }
   
   func removeCoin(_ coinId: String) {
      if let first = favoriteCoinList.filter({ $0.id == coinId }).first, 
      let index = favoriteCoinList.firstIndex(of: first) {
         favoriteCoinList.remove(at: index)
      }
   }
   
   func isFavoriteCoin(_ coinId: String) -> Bool {
      return !favoriteCoinList.filter { $0.id == coinId }.isEmpty
   }
}

struct ContentView: View {
   @StateObject private var favoriteCoinList = FavoriteObject()
   
   var body: some View {
      NavigationView {
         HomeView()
            .environmentObject(favoriteCoinList)
      }
   }
}

#Preview {
   ContentView()
}
