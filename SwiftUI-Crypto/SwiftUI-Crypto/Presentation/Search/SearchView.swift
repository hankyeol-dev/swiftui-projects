//
//  SearchView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct SearchView: View {
   @EnvironmentObject private var favoriteList: FavoriteObject
   @State private var searchedText: String = ""
   @State private var searchedList: [SearchedCoin] = dummySearchedCoins.coins.map { coin in
      return SearchedCoin(coin: coin, isSelected: false)
   }
   
   var body: some View {
      NavigationStack {
         ExpendableSearchBar()
         ScrollView(.vertical) {
            LazyVStack(spacing: 12) {
               ForEach($searchedList, id: \.coin.id) { search in
                  SearchedItemView(searchedCoin: search)
               }
            }
         }
         .padding(.horizontal, 16)
      }
   }
   
   @ViewBuilder
   fileprivate func ExpendableSearchBar(_ titleMessage: String = "Coin Search") -> some View {
      VStack(spacing: 10) {
         Text(titleMessage)
            .font(.largeTitle.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
         
         HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
               .font(.title3)
            TextField("코인 검색", text: $searchedText)
         }
         .padding(.horizontal, 16)
         .padding(.vertical, 16)
//         .frame(height: 44)
         .background(RoundedRectangle(cornerRadius: 25.0).fill(.graySm))
      }
      .padding()
   }
}

struct SearchedItemView: View {
   @EnvironmentObject fileprivate var favoriteList: FavoriteObject
   @Binding fileprivate var searchedCoin: SearchedCoin
   
   var body: some View {
      HStack {
         AsyncImage(url: URL(string: searchedCoin.coin.thumb)) { phase in
            if let image = phase.image {
               image
                  .resizable()
                  .frame(width: 36, height: 36)
                  .clipShape(Circle())
            }
            if phase.error != nil {
               Color.graySm
            }
         }
         
         VStack(alignment: .leading, spacing: 2) {
            Text(searchedCoin.coin.name)
               .font(.system(size: 14, weight: .medium))
            Text(searchedCoin.coin.symbol)
               .font(.system(size: 12, weight: .light))
               .foregroundStyle(.grayMd)
         }
         
         Spacer()
         
         Button {
            searchedCoin.isSelected.toggle()
            if favoriteList.isFavoriteCoin(searchedCoin.coin.id) {
               favoriteList.removeCoin(searchedCoin.coin.id)
            } else {
               favoriteList.appendCoin(.init(id: searchedCoin.coin.id, coin_id: 0, name: searchedCoin.coin.name, symbol: searchedCoin.coin.symbol, marketRank: 0, small: searchedCoin.coin.thumb, data: .init(price: 0.0, priceChangePercent: .init(usd: 0))))
               dump(favoriteList.favoriteCoinList)
            }
         } label: {
            searchedCoin.isSelected ? Image(systemName: "star.fill")
               .foregroundStyle(.purple)
            : Image(systemName: "star")
               .foregroundStyle(.purple)
         }
      }
      .padding(.vertical, 8)
   }
}

#Preview {
   SearchView()
      .environmentObject(FavoriteObject())
}
