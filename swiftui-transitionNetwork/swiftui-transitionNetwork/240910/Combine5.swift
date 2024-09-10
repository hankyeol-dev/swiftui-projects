//
//  Combine5.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import SwiftUI

struct Combine5: View {
   @StateObject fileprivate var combine5ViewModel: Combine5ViewModel
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical) {
            if !combine5ViewModel.output.didOnTaskOutput.isEmpty {
               Combine5ListView(marketList: combine5ViewModel.output.didOnTaskOutput)
            }
         }
         .navigationTitle("Combine3")
      }
      .task {
         combine5ViewModel.action(.didOnTask)
      }
   }
}

private struct Combine5ListView: View {
   fileprivate let marketList: Markets
   
   var body: some View {
      LazyVStack {
         ForEach(marketList, id: \.market) { spend in
            Combine5ListViewCell(marketItem: spend)
         }
      }
   }
}

private struct Combine5ListViewCell: View {
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
   Combine5(combine5ViewModel: .init())
}
