//
//  CategoryView.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/4/24.
//

import SwiftUI

struct CategoryModel: Hashable, Identifiable {
   let id: UUID = UUID()
   let category: String
   var count: Int
}

struct CategoryView: View {
   @State private var searchedText: String = ""
   @State private var categoryList: [CategoryModel] = []
   
   var body: some View {
      NavigationView {
         VStack {
            Spacer().frame(height: 24)
            List {
               ForEach(searchedText.isEmpty ? categoryList : categoryList.filter { $0.category.contains(searchedText) }, id: \.id) { category in
                  NavigationLink {
                     NavigatingViewWrapper(CategoryDetailView(category: "\(category.category) (\(category.count))"))
                  } label: {
                     HStack {
                        Image(systemName: "person")
                        Spacer().frame(width: 16)
                        Text("\(category.category) (\(category.count))")
                     }
                  }
               }
            }
         }
         .navigationTitle("toolbar")
         .searchable(text: $searchedText, placement: .navigationBarDrawer, prompt: "검색?")
         .toolbar {
            Button {
               appendOrCountUpCategoryList()
            } label: {
               Text("추가")
            }
         }
      }
   }
   
   fileprivate func appendOrCountUpCategoryList() {
      
      if let randomCategory = ["로맨스", "액션", "스릴러", "사극", "애니메이션", "가족", "SF"].randomElement() {
         
         let filteredList = categoryList.filter { $0.category == randomCategory }
         
         if filteredList.isEmpty {
            categoryList.append(.init(category: randomCategory, count: 1))
         } else {
            if var first = filteredList.first, let index = categoryList.firstIndex(of: first) {
               first.count += 1
               categoryList[index] = first
            }
         }
      }
   }
}

struct CategoryDetailView: View {
   fileprivate let category: String
   
   var body: some View {
      Text(category)
   }
}


#Preview {
   CategoryView()
}
