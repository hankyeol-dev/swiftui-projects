//
//  FavoriteViewModel.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/8/24.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
   @Published var favoriteCoins: [CoinItem]
   
   init(
      favoriteCoins: [CoinItem] = []
   ) {
      self.favoriteCoins = favoriteCoins
   }
}
