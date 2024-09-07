//
//  SearchView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
       NavigationStack {
          ScrollView(.vertical) {
             
          }
          .navigationTitle("Coin Search")
       }
    }
}

fileprivate struct SearchItemView: View {
   
   var body: some View {
      /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
   }
}

#Preview {
    SearchView()
}
