//
//  Socket1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI

struct Socket1: View {
   @StateObject private var socketViewModel = Socket1ViewModel()
   
   var body: some View {
      VStack {
         HStack(spacing: 16) {
            Button {
               socketViewModel.getOrderbook()
            } label: {
               Text("socket open")
            }
            .padding()
            
            Button {
               socketViewModel.stop()
            } label: {
               Text("socket close")
            }
            .padding()
         }
         
         HStack {
            List(socketViewModel.bidOrderbooks, id: \.id) { orderbook in
               VStack {
                  Text("\(orderbook.price.formatted())")
                  Text("\(orderbook.size)")
               }
            }
            .listStyle(.plain)
            .foregroundStyle(.blue)
            
            List(socketViewModel.askOrderbooks, id: \.id) { orderbook in
               VStack {
                  Text("\(orderbook.price.formatted())")
                  Text("\(orderbook.size)")
               }
            }
            .listStyle(.plain)
            .foregroundStyle(.red)
         }
         .padding(.horizontal, 16)
      }
   }
}

#Preview {
   Socket1()
}
