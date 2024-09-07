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
            if !favorites.isEmpty, favorites.count >= 2 {
               VStack {
                  TrendingSectionTitleView(title: "My Favorite")
                  FavoriteCryptoContentsView(coinItems: $favorites)
               }
            }
            
            Spacer().frame(height: 24)
            
            VStack {
               TrendingSectionTitleView(title: "Top 15 Coins")
               TabView {
                  ForEach(favorites, id: \.coin_id) { favorite in
                     LazyVStack {
                        TrendingTabCell(coinItem: favorite)
                        TrendingTabCell(coinItem: favorite)
                        TrendingTabCell(coinItem: favorite)
                     }
                  }
               }
               .tabViewStyle(.page(indexDisplayMode: .automatic))
               .tabViewStyle(PageTabViewStyle())
            }
            .frame(width: .infinity, height: 240)
            
            Spacer().frame(height: 24)
            
            VStack {
               TrendingSectionTitleView(title: "Top 7 NFTs")
               ScrollView(.horizontal) {
                  LazyHStack {
                     ForEach(0..<5) { _ in
                        TrendingNftList()
                     }
                  }
               }
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
      VStack(alignment: .leading, spacing: 12) {
         HStack(alignment: .center, spacing: 12) {
            AsyncImage(url: URL(string: coinItem.small)) { phase in
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
      .padding(.horizontal, 20)
      .padding(.vertical, 16)
      .background(.graySm)
      .cornerRadius(16, corners: .allCorners)
   }
}

struct TrendingTabCell: View {
   fileprivate var coinItem: CoinItem
   
   var body: some View {
      HStack(alignment: .center) {
         Text("1")
         AsyncImage(url: URL(string: coinItem.small)) { phase in
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
         VStack(alignment: .leading, spacing: 4) {
            Text(coinItem.name)
               .font(.system(size: 16, weight: .bold))
            Text(coinItem.symbol)
               .font(.system(size: 13))
               .foregroundStyle(.grayMd)
         }
         Spacer()
         VStack(alignment: .leading, spacing: 4) {
            Text(String(coinItem.data.roundedPrice.formatted(.currency(code: "usd"))))
               .font(.system(size: 16, weight: .bold))
            Text(String(coinItem.data.roundedChangePercent) + "%")
               .font(.system(size: 13))
               .foregroundStyle(.grayMd)
         }
      }
      .padding()
   }
}

struct TrendingNftList: View {
   let columns = Array(repeating: GridItem(spacing: 10), count: 1)
   
   var body: some View {
      LazyVGrid(columns: columns, spacing: 20) {
            TrendingTabCell(coinItem: dummyTrendings.coins[0])
               .frame(width: 320)
            TrendingTabCell(coinItem: dummyTrendings.coins[0])
               .frame(width: 320)
            TrendingTabCell(coinItem: dummyTrendings.coins[0])
               .frame(width: 320)
      }
   }
}

#Preview {
   TrendingView()
}
