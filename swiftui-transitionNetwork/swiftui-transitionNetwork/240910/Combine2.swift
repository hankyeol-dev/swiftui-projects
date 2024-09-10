//
//  Combine2.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import SwiftUI

struct Combine2: View {
   @StateObject private var combine2ViewModel = Combine2ViewModel()
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical) {
            if !combine2ViewModel.getMarketList().isEmpty {
               Combine2ListView(marketList: combine2ViewModel.getMarketList())
            }
         }
         .navigationTitle("Combine2")
      }
      .task {
         await combine2ViewModel.setMarketList()
      }
   }
}

private struct Combine2ListView: View {
   fileprivate let marketList: Markets
   
   var body: some View {
      LazyVStack {
         ForEach(marketList, id: \.market) { spend in
            Combine2ListViewCell(marketItem: spend)
         }
      }
   }
}

private struct Combine2ListViewCell: View {
   fileprivate let marketItem: Market
   
   var body: some View {
      HStack(alignment: .center) {
         Spacer().frame(width: 16)
         VStack(alignment: .leading, spacing: 4.0) {
            Text(marketItem.koreanName)
               .font(.system(size: 16, weight: .semibold))
            Text(marketItem.englishName)
               .font(.system(size: 13))
         }
         
         Spacer()
         Text(marketItem.market)
            .font(.system(size: 20, weight: .semibold))
         Spacer().frame(width: 16)
      }
      .padding(.vertical, 8)
   }
}

#Preview {
   Combine2()
}
