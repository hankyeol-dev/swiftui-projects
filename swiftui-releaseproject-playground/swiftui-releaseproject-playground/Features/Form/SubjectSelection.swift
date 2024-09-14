//
//  SubjectSelection.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import SwiftUI

import RealmSwift

struct SubjectSelection: View {
   @Environment(\.dismiss) private var dismiss
   
   @ObservedResults(Subject.self)
   private var subjectObject
   
   @State private var tempText: String = ""
   @State private var isPresentAlert: Bool = false
   
   var body: some View {
      VStack {
         CustomNavigationBar(action: dismissView, title: "사유 주제 선택", icon: "chevron.left")
         
         ScrollView {
            VStack(alignment: .leading) {
               Text("주제를 선택해보세요.")
                  .byCustomFont(.kjcRegular, size: 18)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.horizontal, 16.0)
                  .padding(.bottom, 4.0)
               
               TextField("주제 입력", text: $tempText)
                  .padding(.horizontal, 16.0)
                  .tint(.baseBlack)
                  .font(.custom(Text.CustomFont.kjcRegular.rawValue, size: 16))
               
            }
            .padding(.vertical, 8.0)

            
            GroupBox {
               GroupBox {
                  SubjectItemView(items: subjectObject.map { $0.bySubjectItem })
               }
               .groupBoxStyle(.customGroupBox())
            } label: {
               Text("추천하는 주제")
            }
            .groupBoxStyle(.customGroupBox(hSpacing: 16.0, vSpacing: 12.0))
            
            
            Button {
               if !tempText.isEmpty {
                  let overlapCheck = checkIsAlreadyGeneratedSubject(for: tempText)
                  
                  if !overlapCheck {
                     $subjectObject.append(.init(title: tempText))
                     tempText = ""
                  } else {
                     isPresentAlert = true
                  }
               }
            } label: {
               asRoundedButton(title: "주제 업로드",
                               background: tempText.isEmpty ? .orange.opacity(0.5) : .orange)
            }
            .disabled(tempText.isEmpty)
         }
      }
      .padding()
      .alert("이미 생성된 주제에요 ㅠ", isPresented: $isPresentAlert) {
         Button("확인", role: .cancel) {
            tempText = ""
         }
      }
   }
   
   private func dismissView() { dismiss() }
   
   private func checkIsAlreadyGeneratedSubject(for subject: String) -> Bool {
      let first = subjectObject.first { sub in
         sub.title == subject
      }
      
      guard first == nil else { return true }
      return false
   }
}

struct SubjectItemView: View {
   private let items: [SubjectItem]
   
   init(items: [SubjectItem]) {
      self.items = items
   }
   
   var body: some View {
      LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
         ForEach(items, id: \.id) { item in
            Text(item.subject)
         }
      }
   }
}


#Preview {
    SubjectSelection()
}
