//
//  NetworkView1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/3/24.
//

import SwiftUI

enum SpendType: String, CaseIterable {
   case study = "자기계발"
   case food = "식비"
   case house = "정기지출"
   case hobby = "취미"
   case deposit = "저축"
}

struct SpendModel: Hashable, Identifiable {
   let id: UUID = UUID()
   let name: String
   let type: SpendType
   let amount: Int
   
   var amountFormat: String {
      return String(amount.formatted()) + "원"
   }
}

struct NetworkView1: View {
   @State private var spendList: [SpendModel] = (0...300).map { num in
      return SpendModel(name: "\(num) 내역", type: SpendType.allCases.randomElement()!, amount: Int.random(in: 1000..<10000))
   }
   
   var body: some View {
      NavigationView {
         ScrollView {
            VStack {
               SpendBannerView( 
                  color: .random(),
                  totalAmount: spendList.reduce(0, { cv, mv in cv + mv.amount })
               )
               
               Spacer()
                  .frame(height: 24)
               
               SpendList(spendList: $spendList)
            }
         }
         .navigationTitle("My Money")
         .refreshable {
            let randomAmount = Int.random(in: 1000...10000)
            if let randomType = SpendType.allCases.randomElement() {
               spendList.insert(.init(name: "새로운 아이템 추가", type: randomType, amount: randomAmount), at: 0)
            }
         }
      }
      .onAppear {
         spendList.shuffle()
      }
   }
}

struct SpendList: View {
   @Binding var spendList: [SpendModel]
   
   var body: some View {
      LazyVStack {
         ForEach(spendList, id: \.id) { spend in
            SpendListCell(spendItem: spend)
         }
      }
   }
}

struct SpendListCell: View {
   let spendItem: SpendModel
   
   var body: some View {
      HStack(alignment: .center) {
         Spacer().frame(width: 16)
         VStack(alignment: .leading, spacing: 4.0) {
            Text(spendItem.name)
               .font(.system(size: 16, weight: .semibold))
            Text(spendItem.type.rawValue)
               .font(.system(size: 13))
         }
         
         Spacer()
         Text(spendItem.amountFormat)
            .font(.system(size: 20, weight: .semibold))
         Spacer().frame(width: 16)
      }
      .padding(.vertical, 8)
   }
}

struct SpendBannerView: View {
   let color: Color
   let totalAmount: Int
   
   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16.0)
            .fill(color)
            .overlay(alignment: .leading) {
               Circle()
                  .fill(.white.opacity(0.18))
                  .scaleEffect(1.75)
                  .offset(x: -72.0, y: 25.0)
               
            }
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .frame(height: 180)
            .padding(.top, 16)
            .padding(.horizontal, 16)
         
         VStack(alignment: .leading) {
            Spacer()
            Text("나의 소비내역")
               .font(.system(size: 20, weight: .semibold))
               .foregroundStyle(.white.opacity(20.0))
            Text(
               "\(totalAmount.formatted())원"
            )
            .font(.system(size: 32, weight: .bold))
            .foregroundStyle(.white.opacity(20.0))
            Spacer().frame(height: 24)
         }
         .frame(maxWidth: .infinity, alignment: .leading)
         .padding(.leading, 36)
      }
   }
}

#Preview {
   NetworkView1()
}
