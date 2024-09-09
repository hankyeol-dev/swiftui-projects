//
//  TrendingView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct TrendingView: View {
   @EnvironmentObject private var favoriteList: FavoriteObject
   @State private var trendingItems: TrendingOutputs = .init(coins: [], nfts: [])
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical) {
            if !favoriteList.favoriteCoinList.isEmpty, favoriteList.favoriteCoinList.count >= 2 {
               VStack {
                  TrendingSectionTitleView(title: "My Favorite")
                  FavoriteCryptoContentsView(coinItems: $favoriteList.favoriteCoinList)
               }
            }
            
            Spacer().frame(height: 24)
            
            LazyVStack {
               TrendingSectionTitleView(title: "Top 15 Coins")
               ScrollView(.horizontal) {
                  if !trendingItems.coins.isEmpty {
                     LazyHStack {
                        ForEach(0..<5) { num in
                           let targetIndex = num * 3
                           let sendItems = trendingItems.coinsToTrendingListViewItems[targetIndex...targetIndex + 2].map { $0 }
                           
                           TrendingList(startIndex: targetIndex + 1, isCoinList: true, listItems: sendItems)
                        }
                     }
                  }
               }
            }
            
            Spacer().frame(height: 24)
            
            LazyVStack {
               TrendingSectionTitleView(title: "Top 7 NFTs")
               ScrollView(.horizontal) {
                  if !trendingItems.nfts.isEmpty {
                     LazyHStack {
                        ForEach(0..<3) { num in
                           let targetIndex = num * 3
                           let sendItems = trendingItems.nftsToTrendingListViewItems[targetIndex == 6 ? 6...6 : targetIndex...targetIndex + 2].map { $0 }
                           
                           TrendingList(startIndex: targetIndex + 1, isCoinList: false, listItems: sendItems)
                        }
                     }
                  }
               }
            }
         }
         .navigationTitle("Crypto Coin")
//         .task {
//            do {
//               let datas = try await Network.getTrending()
//               trendingItems.coins = datas.coins
//               trendingItems.nfts = datas.nfts
//            } catch {
//               print(error)
//            }
//         }
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
            
            ForEach(coinItems, id: \.id) { item in
               FavoriteCryptoContent(coinItem: item)
            }
            
            if coinItems.count == 3 {
               Button {} label: {
                  Text("좋아요 한 코인\n더보기")
                     .frame(width: 200, height: 120)
                     .padding(.horizontal, 20)
                     .padding(.vertical, 16)
                     .background(.graySm)
                     .foregroundStyle(.black)
                     .clipShape(.rect(cornerRadius: 12))
               }
            }
         }
         .padding(.horizontal, 16)
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

struct TrendingList: View {
   fileprivate let startIndex: Int
   fileprivate let isCoinList: Bool
   fileprivate let listItems: [TrendingListViewItem]
   private let columns = Array(repeating: GridItem(spacing: 10), count: 1)
   
   var body: some View {
      LazyVGrid(columns: columns, alignment: .leading) {
         if isCoinList {
            ForEach(0..<3) { num in
               NavigationLink {
                  
               } label: {
                  TrendingItemCell(rank: startIndex + num, item: listItems[num])
                     .frame(width: 320)
               }
            }
         } else {
            if startIndex < 6 {
               ForEach(0..<3) { num in
                  TrendingItemCell(rank: startIndex + num, item: listItems[num])
                     .frame(width: 320)
               }
            } else {
               TrendingItemCell(rank: startIndex, item: listItems[0])
                  .frame(width: 320)
               Rectangle()
                  .fill(.clear)
                  .frame(width: 320, height: 80)
               Rectangle()
                  .fill(.clear)
                  .frame(width: 320, height: 80)
            }
         }
      }
   }
}

struct TrendingItemCell: View {
   fileprivate var rank: Int
   fileprivate var item: TrendingListViewItem
   
   var body: some View {
      HStack(alignment: .center) {
         Text(String(rank))
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(.black)
         AsyncImage(url: URL(string: item.image)) { phase in
            if let image = phase.image {
               image
                  .resizable()
                  .frame(width: 32, height: 32)
                  .clipShape(Circle())
            }
            if phase.error != nil {
               RoundedRectangle(cornerRadius: 24)
                  .fill(.graySm)
                  .frame(width: 32, height: 32)
            }
         }
         VStack(alignment: .leading) {
            Text(item.name)
               .font(.system(size: 16, weight: .bold))
               .foregroundStyle(.black)
            Text(item.symbol)
               .font(.system(size: 13))
               .foregroundStyle(.grayMd)
         }
         Spacer()
         VStack(alignment: .trailing, spacing: 4) {
            Text(String(item.price))
               .font(.system(size: 16, weight: .bold))
               .foregroundStyle(.black)
            Text(String(item.priceChangePercent) + "%")
               .font(.system(size: 13))
               .foregroundStyle(item.priceChangePercent >= 0 ? .red : .blue)
         }
      }
      .padding()
   }
}
#Preview {
   TrendingView()
      .environmentObject(FavoriteObject())
}
