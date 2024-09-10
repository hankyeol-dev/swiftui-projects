//
//  ContentView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

class CountObservable: ObservableObject {
   @Published var count: Int = 0
   
   func countUp() { count += 1 }
   func countDown() { count -= 1 }
}

struct CounterView: View {
   @StateObject private var countObservable = CountObservable()
   @State private var text: String = ""
   
   var body: some View {
      TextField("placeholder", text: $text)
      CounterTextView(countObservable: countObservable)
      Button {
         countObservable.countUp() // @published 멤버를 업데이트 할 수 있다.
      } label: { Text("Count Up") }
      
      Button {
         countObservable.countDown() // @published 멤버를 업데이트 할 수 있다.
      } label: { Text("Count Down") }
   }
}

struct CounterTextView: View {
   @ObservedObject var countObservable: CountObservable
   
   var body: some View {
      Text("\(countObservable.count)")
   }
}

struct ContentView: View {
   var body: some View {
      VStack {
         Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
         Text("Hello, world!")
      }
      .padding()
   }
}

#Preview {
   CounterView()
}
