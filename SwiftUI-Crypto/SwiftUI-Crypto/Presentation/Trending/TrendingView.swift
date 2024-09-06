//
//  TrendingView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct TrendingView: View {
   @State private var favorites: [CoinItem] = dummyTrendings.coins
   
   var body: some View {
      NavigationStack {
         ScrollView(.vertical) {
            if !favorites.isEmpty {
               TrendingSectionTitleView(title: "My Favorite")
               FavoriteCryptoContentsView(coinItems: $favorites)
            }
         }
         .navigationTitle("Crypto Coin")
      }
   }
}

struct TrendingSectionTitleView: View {
   fileprivate let title: String
   var body: some View {
      HStack {
         Text(title)
            .font(.system(size: 20, weight: .bold))
         Spacer()
      }
      .padding(.leading, 16)
   }
}

struct FavoriteCryptoContentsView: View {
   @Binding fileprivate var coinItems: [CoinItem]
   
   var body: some View {
      ScrollView(.horizontal) {
         HStack(spacing: 16) {
            ForEach(coinItems, id: \.coin_id) { item in
               FavoriteCryptoContent(coinItem: item)
            }
         }
         .padding(.leading, 16)
      }
      .scrollIndicators(.hidden)
   }
}

struct FavoriteCryptoContent: View {
   fileprivate var coinItem: CoinItem
   
   var body: some View {
      VStack(alignment: .leading) {
         HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: coinItem.small))
               .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4) {
               Text(coinItem.name)
                  .font(.system(size: 16, weight: .bold))
               Text(coinItem.symbol)
                  .font(.system(size: 13))
                  .foregroundStyle(.grayMd)
            }
            Spacer()
         }
         Spacer()
         VStack(alignment: .leading, spacing: 4) {
            Text(String(coinItem.data.roundedPrice.formatted(.currency(code: "usd"))))
               .font(.system(size: 16, weight: .semibold))
            Text(String(coinItem.data.roundedChangePercent) + "%")
               .font(.system(size: 16, weight: .semibold))
               .foregroundStyle(coinItem.data.roundedChangePercent < 0 ? .red : .blue)
         }
      }
      .frame(width: 200, height: 120)
      .padding(.all, 12)
      .background(.graySm)
      .cornerRadius(16, corners: .allCorners)
   }
}

#Preview {
   TrendingView()
}
