//
//  CreateSub.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/15/24.
//

import SwiftUI

import RealmSwift

struct CreateSub: View {
   @Environment(\.dismiss) private var dismiss
   @EnvironmentObject private var dbManager: RealmManager
   
   private let subject: String
   @State private var subViewItems: [SubViewItem] = []
   
   @ObservedResults(Subject.self)
   private var subjects
   @ObservedResults(Sub.self)
   private var subs
   
   init(subject: String) {
      self.subject = subject
   }
   
   var body: some View {
      NavigationView {
         VStack {
            CustomNavigationBar(action: dismissView, title: "사유하기", icon: "chevron.left")
            ScrollView {
               GroupBox {
                  asRoundedButton(
                     title: subject,
                     radius: 16.0,
                     background: .baseBlack,
                     foreground: .white,
                     height: 36,
                     fontSize: 16.0,
                     font: .kjcRegular)
               } label: {
                  Text("오늘의 사유 주제")
               }
               .groupBoxStyle(.customGroupBox(
                  labelFont: .kjcRegular,
                  labelColor: .baseBlack.opacity(0.8),
                  hSpacing: 8.0,
                  vSpacing: 12.0,
                  radius: 16.0))
               
               GroupBox {
                  if subViewItems.isEmpty {
                     Button {
                        subViewItems.append(.init(title: "", content: ""))
                     } label: {
                        asRoundedButton(title: "함께 사유할 내용 추가하기",
                                        background: .grayMd,
                                        foreground: .baseBlack,
                                        fontSize: 14,
                                        font: .kjcRegular)
                     }
                  } else {
                     ForEach($subViewItems, id: \.id) { item in
                        CreateSubFormView(title: item.title,
                                          content: item.content,
                                          isChecked: item.isSelected)
                     }
                  }
               } label: {
                  Text("사유 할 때 함께 고민할 거리가 있나요?")
               }
               .groupBoxStyle(.customGroupBox(
                  labelFont: .kjcRegular,
                  labelColor: .baseBlack.opacity(0.8),
                  hSpacing: 16.0,
                  vSpacing: 12.0,
                  radius: 16.0)
               )
            }
            .navigationBarBackButtonHidden()
            .padding(.horizontal, 16.0)
         }
         .task {
            if let template = isSystemTemplate(subject) {
               subViewItems = template.byKoreanSubViewItems
            }
         }
      }
   }
   
   private func dismissView() {
      dismiss()
   }
}

extension CreateSub {
   private func isSystemTemplate(_ subject: String) -> SystemSayuTemplate? {
      let filtered = SystemSayuTemplate.allCases.filter { $0.byKoreanSubject == subject }
      return filtered.first
   }
}

struct CreateSubFormView: View {
   @State var height: CGFloat = 40
   
   @Binding var title: String
   @Binding var content: String
   @Binding var isChecked: Bool
   
   var body: some View {
      HStack(alignment: .top, spacing: 8.0) {
         Button {
            isChecked.toggle()
         } label: {
            RoundedRectangle(cornerRadius: 3.0)
               .stroke(lineWidth: 2.0)
               .foregroundStyle(.grayMd)
               .frame(width: 24, height: 24.0)
               .overlay {
                  Image(isChecked ? .checked : .unChecked)
               }
         }
         
         VStack(alignment: .leading, spacing: 8.0) {
            TextField("", text: $title)
            
            CustomTextView(text: $content,
                           height: $height,
                           placeholder: "구체적인 내용을 작성해보세요.",
                           maxHeight: 150.0,
                           textFont: .kjcRegular
            )
         }
      }
      .frame(minHeight: height + 40, maxHeight: .infinity)
   }
}



#Preview {
   CreateSub(subject: "주제")
}
