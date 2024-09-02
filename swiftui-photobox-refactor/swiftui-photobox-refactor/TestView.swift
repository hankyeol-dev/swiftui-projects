//
//  TestView.swift
//  swiftui-photobox-refactor
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct MBTIButtonGroupViews: View {
   @State private var mbtiGroup: [ProfileMBTIModel] = ["I", "E"].map { .init(name: $0, isSelected: false) }
   var body: some View {
      VStack {
         ForEach(mbtiGroup, id: \.name) { mbti in
            Button {
               guard let index = mbtiGroup.firstIndex(of: mbti) else { return }
               
               mbtiGroup.enumerated().forEach { idx, item in
                  if idx != index {
                     if item.isSelected {
                        mbtiGroup[idx].isSelected = false
                        mbtiGroup[index].isSelected = true
                     }
                  } else {
                     if item.isSelected {
                        mbtiGroup[index].isSelected = false
                     } else {
                        mbtiGroup[index].isSelected = true
                     }
                  }
               }
            } label: {
               Text(mbti.name)
                  .padding(.all, 12)
                  .foregroundStyle(mbti.isSelected ? .blue : .black)
                  .font(mbti.isSelected ? .system(size: 15, weight: .semibold) : .system(size: 14, weight: .regular))
                  .frame(width: 32, height: 32)
                  .clipShape(Circle())
                  .overlay(mbti.isSelected ? Circle().stroke(.blue, lineWidth: 1) : Circle().stroke(.black, lineWidth: 1))
            }
         }
      }
   }
}

#Preview {
   MBTIButtonGroupViews()
}
