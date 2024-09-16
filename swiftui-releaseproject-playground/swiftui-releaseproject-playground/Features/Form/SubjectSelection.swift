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
   @State private var selectedItem: SubjectItem?
   
   var body: some View {
      NavigationView {
         VStack {
            CustomNavigationBar(action: dismissView, title: "사유 주제", icon: "chevron.left")
            ScrollView {
               GroupBox {
                  createSubjectItemView(subjectObject.filter({ subject in
                     subject.isSystemSubject
                  }).map { $0.bySubjectItem })
               } label: {
                  Text("이런 내용으로 사유해보세요.")
               }
               .groupBoxStyle(.customGroupBox(hSpacing: 12.0, vSpacing: 12.0))
               .padding(.bottom, 16.0)
               
               GroupBox {
                  VStack(alignment: .leading) {
                     TextField("주제 입력", text: $tempText)
                        .tint(.baseBlack)
                        .background(.blue)
                        .font(.custom(Text.CustomFont.kjcRegular.rawValue, size: 16))
                        .padding(.bottom, 12.0)
                        .disabled(selectedItem != nil)
                     
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
                  .padding(.vertical, 8.0)
               } label: {
                  Text("사유하고 싶은 주제를 직접 만드셔도 되어요.")
               }
               .groupBoxStyle(.customGroupBox(hSpacing: 12.0, vSpacing: 12.0))
               .padding(.bottom, 16.0)
               
               if selectedItem != nil || !tempText.isEmpty {
                  NavigationLink {
                     CreateSub(subject: mapSubject())
                        .navigationBarBackButtonHidden()
                        .environmentObject(RealmManager.manager)
                  } label: {
                     asRoundedButton(title: "사유 내용 작성하러 가기")
                  }
               }
            }
         }
         .padding()
         .alert("이미 생성된 주제에요 ㅠ", isPresented: $isPresentAlert) {
            Button("확인", role: .cancel) {
               tempText = ""
            }
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
   
   private func mapSubject() -> String {
      var subject: String
      if !tempText.isEmpty {
         subject = tempText
      } else {
         if let selectedItem {
            subject = selectedItem.subject
         } else {
            subject = ""
         }
      }
      
      return subject
   }
}

extension SubjectSelection {
   /// system generated subject selectionView
   private func createSubjectItemView(_ items: [SubjectItem]) -> some View {
      LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 8) {
         ForEach(items, id: \.id) { item in
            Button {
               withAnimation(.bouncy) {
                  if selectedItem == item {
                     selectedItem = nil
                  } else {
                     selectedItem = item
                  }
               }
            } label: {
               asRoundedButton(
                  title: item.subject,
                  radius: 12,
                  background: item == selectedItem ? .baseBlack : .grayMd,
                  foreground: item == selectedItem ? .white : .baseBlack,
                  height: 52
               )
               .frame(maxWidth: .infinity)
            }
         }
      }
   }
}

#Preview {
    SubjectSelection()
}
