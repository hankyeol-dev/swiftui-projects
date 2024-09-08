//
//  SearchViewModel.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/8/24.
//

import Foundation

struct SearchedCoin {
   let coin: SearchedCoinItem
   var isSelected: Bool
}

final class SearchViewModel: ObservableObject {
   @Published var searchedConinItems: [SearchedCoin]
   @Published var isDisplayFavoriteAlert: Bool
   
   init(
      searchedConinItems: [SearchedCoin] = [],
      isDisplayFavoriteAlert: Bool = false
   ) {
      self.searchedConinItems = searchedConinItems
      self.isDisplayFavoriteAlert = isDisplayFavoriteAlert
   }
   
   func favoriteButtonTapped(coin: SearchedCoinItem) {
      
   }
}
