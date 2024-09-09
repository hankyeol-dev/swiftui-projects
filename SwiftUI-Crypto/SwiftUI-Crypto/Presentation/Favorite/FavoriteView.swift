//
//  FavoriteView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct FavoriteView: View {
   @EnvironmentObject private var favoriteList: FavoriteObject
   @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]
   @State private var draggingItem: CoinItem?
   
   var body: some View {
      NavigationStack {
         ScrollView(.vertical) {
            let columns = Array(repeating: GridItem(spacing: 10), count: 2)
            LazyVGrid(columns: columns, spacing: 10, content: {
               ForEach(favoriteList.favoriteCoinList, id:\.id) { item in
                  FavoriteListItemView(favoriteItem: item)
               }
            })
            .padding()
         }
         .navigationTitle("Favorite")
      }
   }
}

private struct FavoriteListItemView: View {
   fileprivate let favoriteItem: CoinItem
   
   var body: some View {
      VStack(alignment: .leading, spacing: 12) {
         HStack(alignment: .center, spacing: 12) {
            AsyncImage(url: URL(string: favoriteItem.small)) { phase in
               if let image = phase.image {
                  image
                     .resizable()
                     .frame(width: 24, height: 24)
                     .clipShape(Circle())
               }
               if phase.error != nil {
                  Color.graySm
               }
            }
            VStack(alignment: .leading, spacing: 4) {
               Text(favoriteItem.name)
                  .font(.system(size: 16, weight: .bold))
               Text(favoriteItem.symbol)
                  .font(.system(size: 13))
                  .foregroundStyle(.grayMd)
            }
            Spacer()
         }
         Spacer()
         VStack(alignment: .leading, spacing: 4) {
            Text(String(favoriteItem.data.roundedPrice.formatted(.currency(code: "usd"))))
               .font(.system(size: 16, weight: .semibold))
            Text(String(favoriteItem.data.roundedChangePercent) + "%")
               .font(.system(size: 16, weight: .semibold))
               .foregroundStyle(favoriteItem.data.roundedChangePercent < 0 ? .red : .blue)
         }
      }
      .padding(.horizontal, 20)
      .padding(.vertical, 16)
      .background(.graySm)
      .cornerRadius(16, corners: .allCorners)
   }
}

#Preview {
   FavoriteView()
      .environmentObject(FavoriteObject())
}
