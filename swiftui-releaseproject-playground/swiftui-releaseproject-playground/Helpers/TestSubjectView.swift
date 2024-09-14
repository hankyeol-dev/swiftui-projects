//
//  TestSubjectView.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI


struct TestSubjectItemView: View {
   let items: [String]
   var groupedItems: [[String]] = [[]]
   let screenWidth = UIScreen.main.bounds.width
   
   init(
      items: [String]
   ) {
      self.items = items
      self.groupedItems = createGroupItems(items)
   }
   
   var body: some View {
      VStack(alignment: .leading) {
         ForEach(groupedItems, id: \.self) { items in
            HStack {
               ForEach(items.indices, id:\.self) { index in
                  Text(items[index])
                     .padding(.horizontal, 12)
                     .padding(.vertical, 8)
                     .foregroundStyle(.baseBlack)
                     .background(
                        RoundedRectangle(cornerRadius: 16)
                           .stroke(lineWidth: 1.0)
                     )
               }
            }
         }
      }
   }
   
   private func createGroupItems(_ items: [String]) -> [[String]] {
      var groups: [[String]] = [[]]
      var tempItems: [String] = []
      var accumulateWidth: CGFloat = 0.0
      
      for item in items {
         let label = UILabel()
         label.text = item
         label.sizeToFit()
         
         let itemWidth = label.frame.size.width + 16 // calc based with + hPadding
         
         if (accumulateWidth + itemWidth) < screenWidth - 32 {
            accumulateWidth += itemWidth
            tempItems.append(item)
         } else {
            accumulateWidth = itemWidth
            groups.append(tempItems)
            tempItems.removeAll()
            tempItems.append(item)
         }
      }
      
      groups.append(tempItems)
      
      return groups
   }
}
