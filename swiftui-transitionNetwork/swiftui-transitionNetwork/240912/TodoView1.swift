//
//  TodoView1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI
import RealmSwift

struct TodoView1: View {
   @FocusState private var isFocused: Bool
   @State private var fieldText: String = ""
   
   @ObservedResults(TodoItem.self)
   var todos
   
   var body: some View {
      NavigationView {
         Form {
            Section {
               Text("할 일 입력")
               TextField("할 일", text: $fieldText)
                  .focused($isFocused)
            }
            .listSectionSpacing(8.0)
            
            Section {
               Text("할 일들")
               ForEach(todos, id: \.id) { todo in
                  createTodo(todo)
               }
            }
         }
         .navigationTitle("할 일")
         .onSubmit {
            withAnimation {
               guard !fieldText.isEmpty else {
                  isFocused = true
                  return
               }
               appendTodo(fieldText)
               fieldText = ""
               isFocused = true
            }
         }
      }
   }
   
   @ViewBuilder
   func createTodo(_ todo: TodoItem) -> some View {
      HStack {
         Button {
            toggleTodo(todo)
         } label: {
            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "checkmark.square")
               .foregroundStyle(todo.isCompleted ? .green : .black)
         }
            
         Text(todo.todo)
            .foregroundStyle(todo.isCompleted ? .gray.opacity(0.8) : .black)
            .strikethrough(todo.isCompleted, color: .green)
         
         Spacer()
      }
      .swipeActions(edge: .trailing, allowsFullSwipe: true) {
         Button(role: .destructive) {
            $todos.remove(todo)
         } label: { Text("삭제") }
      }
   }
   
   func appendTodo(_ text: String) {
      withAnimation(.snappy) {
         $todos.append(.init(todo: text))
      }
   }
   
   func toggleTodo(_ todo: TodoItem) {
//      if let index = todos.firstIndex(of: todo) {
//         withAnimation(.snappy(duration: 0.5)) {
//            todos[index].isCompleted.toggle()
//            isFocused = false
//         }
//      }
      withAnimation {
         $todos.remove(todo)
      }
   }
}

#Preview {
   TodoView1()
}
