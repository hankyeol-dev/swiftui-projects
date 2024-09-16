//
//  CustomSegmentedControl.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/16/24.
//

import SwiftUI

struct SegmentedItem: Identifiable {
   let id: UUID = .init()
   let iamge: ImageResource
   let index: Int
   let descript: String
}

struct CustomSegmentedControl: View {
   @Binding var segmentedItems: [SegmentedItem]
   @Binding var selectedIndex: Int
   @Namespace private var animation
   
   var body: some View {
      HStack {
         ForEach(segmentedItems, id: \.id) { item in
            Button {
               print(item.index)
               selectedIndex = item.index
            } label: {
               VStack(alignment: .center) {
                  Image(item.iamge)
                     .resizable()
                     .frame(width: 16.0, height: 16.0)
                  Text(item.descript)
                     .byCustomFont(.kjcRegular, size: 14.0)
                     .foregroundStyle(selectedIndex == item.index ? .white : .graySm)
               }
               .padding(.vertical, 12)
               .padding(.horizontal, 30)
               .background(item.index == selectedIndex ? .primaryBlue : .clear)
               .clipShape(Capsule())
            }
         }
      }
      .padding(.all, 8.0)
      .background(.grayMd)
      .clipShape(Capsule())
      .matchedGeometryEffect(id: "SEGMENTANIMATION", in: animation)
   }
}

#Preview {
   CustomSegmentedControl(
      segmentedItems: .constant(Think.ThinkingType.allCases.map { .init(iamge: $0.byIcons, index: $0.rawValue, descript: $0.byKoreanName) }),
      selectedIndex: .constant(1))
}
