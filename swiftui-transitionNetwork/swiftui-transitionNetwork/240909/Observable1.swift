//
//  Observable1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

struct MainObservable1: View {
   @State private var text = ""
   
   var body: some View {
      NavigationView {
         VStack {
            TextField("입력", text: $text)
               .padding()
            Image(systemName: "star")
            Observable1()
         }
         .navigationTitle("count")
      }
   }
}

struct Observable1: View {
   
   /**
    - @ObservedObject도 @StateObject와 비슷하게 ObservableObject 프로토콜을 준수하는 객체의 내부 변화를 탐지한다.
      - 그러면 두 차이는?
         => 하위 뷰에서 ObservedObject로 상태 객체를 가지고 있는 경우, 상위의 이벤트에 의해 값이 초기화 된다.
         => StateObject 형태는 상위 뷰의 이벤트에 따라서 초기화가 따로 되지 않음
         - 상위뷰가 업데이트 되는 것(body rerender) ==> 하위의 뷰는 Init이 된다. ==> @ObservedObject는 매번 새롭게 초기화 됨
         - 상위뷰가 업데이트 되더라도, @StateObject는 재사용하기 때문에 초기화가 다시 되지 않는다.
    */
   
   @StateObject private var viewModel = Observable1ViewModel()
   
   var body: some View {
      Text("\(viewModel.count)")
      Button { viewModel.countUp() } label: { Text("count up") }
   }
}

final fileprivate class Observable1ViewModel: ObservableObject {
   @Published fileprivate var count: Int = 0
   
   init() {
      print("viewMoel init")
   }
   
   func countUp() { count += 1 }
}

#Preview {
   MainObservable1()
}
