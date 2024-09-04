//
//  NetworkView2.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/3/24.
//

import SwiftUI

struct NetworkView2: View {
   @State private var marketList: Markets = []
   @State private var searchText: String = ""
   
   var body: some View {
      NavigationView {
         ScrollView {
            VStack {
               TextField("코인을 검색해보세요.", text: $searchText)
                  .padding(.horizontal, 16)
               Spacer().frame(height: 16)
               Button {
                  
               } label: {
                  Text("검색")
                     .padding()
                     .background(.black)
                     .foregroundStyle(.white)
                     .frame(width: 300)
               }
               
               Spacer().frame(height: 16)
               MarketList(marketList: $marketList)
            }
         }
         .navigationTitle("Search Coin")
         .refreshable {
            marketList.shuffle()
         }
      }
      .task {
         // iOS15+ => .task { } 비동기 모디파이어
         // + 시작된 task에 대한 취소가 지원되어서, View가 사라지면 task가 자동 중단
         
         do {
            marketList = try await UpbitAPI.fetchAllMarket()
         } catch {
            print(error)
         }
      }
      .onAppear {
         // 무조건 동기적으로 돌아가도록 처리
         // => 해당 컨텍스트에서 비동기 처리를 하려면 DispatchQueue.global().async {} 랩핑이 필요함
         // + 시작된 task에 대한 취소가 되지 않는다.
      }
   }
}

struct MarketList: View {
   @Binding var marketList: Markets
   
   var body: some View {
      LazyVStack {
         ForEach(marketList, id: \.market) { spend in
            MarketListCell(marketItem: spend)
         }
      }
   }
}

struct MarketListCell: View {
   let marketItem: Market
   
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
   NetworkView2()
}
