//
//  AddSteps.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/11/24.
//

import SwiftUI

struct BindingTextFieldItems: Hashable, Identifiable {
   let id: UUID = UUID()
   var bindingText: String
}

struct AddSteps: View {
   @State private var bindingTextlist: [BindingTextFieldItems] = []
   
   
   var body: some View {
      ScrollView {
         VStack {
            if !bindingTextlist.isEmpty {
               ForEach($bindingTextlist, id: \.id) { item in
                  createField(for: item.bindingText)
                     .onSubmit {
                        print("Form에서 서브밋?")
                     }
               }
            }
            
            Spacer.height(16)
            
            Button {
               bindingTextlist.append(.init(bindingText: ""))
            } label: {
               RoundedRectangle(cornerRadius: 12)
                  .foregroundStyle(.blue)
                  .frame(height: 44)
                  .overlay {
                     Text("추가하기")
                        .foregroundStyle(.white)
                  }
            }
         }
         .padding(.horizontal, 16)
      }
   }
   
   @ViewBuilder
   private func createField(for fieldText: Binding<String>) -> some View {
      TextField("입력해봐", text: fieldText)
         .padding(.horizontal, 16)
         .frame(height: 44.0)
         .background(.white)
         .tint(.green)
         .clipShape(.rect(cornerRadius: 8.0))
         .shadow(color: .black.opacity(0.2), radius: 2, x: 0.0, y: 2.0)
   }
}

#Preview {
   AddSteps()
}

extension Spacer {
   static func height(_ figure: CGFloat) -> some View {
      return Self().frame(height: figure)
   }
}
