//
//  Combine1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import SwiftUI

struct Combine1: View {
   @State private var marketList: Markets = []
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical) {
            Combine1ListView(marketList: $marketList)
         }
         .navigationTitle("Combine1")
      }
      .task {
         do {
            marketList = try await UpbitAPI.fetchAllMarket()
         } catch {
            dump(error)
         }
      }
   }
}

private struct Combine1ListView: View {
   @Binding var marketList: Markets
   
   var body: some View {
      LazyVStack {
         ForEach(marketList, id: \.market) { spend in
            Combine1ListViewCell(marketItem: spend)
         }
      }
   }
}

private struct Combine1ListViewCell: View {
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
   Combine1()
}
