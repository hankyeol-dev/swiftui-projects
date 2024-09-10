//
//  Combine3.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/10/24.
//

import SwiftUI

struct Combine3: View {
   @StateObject private var combine3ViewModel = Combine3ViewModel()
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical) {
            if !combine3ViewModel.output.didOnTaskOutput.value.isEmpty {
               Combine3ListView(marketList: combine3ViewModel.output.didOnTaskOutput.value)
            }
         }
         .navigationTitle("Combine3")
      }
      .task {
         print("task start")
         combine3ViewModel
            .input
            .didOnTask
            .send(())
      }
   }
}

private struct Combine3ListView: View {
   fileprivate let marketList: Markets
   
   var body: some View {
      LazyVStack {
         ForEach(marketList, id: \.market) { spend in
            Combine3ListViewCell(marketItem: spend)
         }
      }
   }
}

private struct Combine3ListViewCell: View {
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
   Combine3()
}
