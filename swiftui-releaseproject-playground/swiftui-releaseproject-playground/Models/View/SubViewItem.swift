//
//  SubViewItem.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/16/24.
//

import Foundation

class SubViewItem: ObservableObject, Identifiable {
   let id: UUID = .init()
   
   @Published var title: String
   @Published var content: String
   @Published var isSelected: Bool = false
   
   init(
      title: String,
      content: String,
      isSelected: Bool = false
   ) {
      self.title = title
      self.content = content
      self.isSelected = isSelected
   }
}
