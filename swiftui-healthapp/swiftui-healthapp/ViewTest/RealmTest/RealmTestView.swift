//
//  RealmTestView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

import MijickNavigationView
import RealmSwift

struct RealmTestView: NavigatableView {
   @State private var editorText: String = ""
   
   @ObservedResults(Subject.self)
   private var subjectObject
   
   var body: some View {
      VStack {
         HStack {
            Spacer()
            Menu {
               Button {
                  CreateSubView().push(with: .horizontalSlide)
               } label: {
                  Text("서브 제작")
               }
            } label: {
               Image(systemName: "plus")
            }
         }
         .padding(.top)
         .padding(.horizontal)
         .background(.white)
         .ignoresSafeArea()
         .frame(height: 44)
         
         
         Form {
            Section {
               TextField("주제를 작성해보세요", text: $editorText)
            }
         }
         
         Button {
            if !editorText.isEmpty {
               saveSubject(editorText)
            }
            editorText = ""
         } label: {
            RoundedRectangle(cornerRadius: 24)
               .frame(maxWidth: .infinity)
               .frame(height: 44)
               .padding(.horizontal, 16)
               .overlay {
                  Text("추가하기")
                     .foregroundStyle(.white)
               }
         }
      }
      .onAppear {
         print(Realm.Configuration.defaultConfiguration.fileURL)
      }
   }
   
   private func saveSubject(_ text: String) {
      if !text.isEmpty {
         $subjectObject.append(.init(content: text))
      }
   }
}

fileprivate struct CreateSubView: NavigatableView {
   @State private var subTexts: [String] = ["", "", "", "", "", ""]
   
   func configure(view: NavigationConfig) -> NavigationConfig {
      view
         .navigationBackGesture(.drag)
   }
   
   var body: some View {
      VStack {
         
         Form {
            Section {
               ForEach(subTexts.indices, id: \.self) { index in
                  TextField("\(index) 서브 입력", text: $subTexts[index])
                  
               }
            }
         }
      }
   }
}
