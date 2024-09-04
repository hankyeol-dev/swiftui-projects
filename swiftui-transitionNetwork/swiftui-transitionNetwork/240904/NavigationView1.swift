//
//  NavigationView1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/4/24.
//

import SwiftUI

struct NavigationView1: View {
   /**
    - View 구조체의 init과 body 연산자를 호출하는 시점은 명확하게 다르다.
      =>  단순히 다음으로 push될 화면을 감싸는 역할만 하는 중간 View를 두면 미리 init되는걸 방지는 할 수 있다. (init 시점을 미룬다.)
    */
   var body: some View {
      NavigationView {
         NavigationLink {
            NavigatingViewWrapper(PushedView())
         } label: {
            Text("navigation")
               .navigationTitle("navigation view")
         }
      }
   }
}

struct PushedView: View {
   
   init() { print("등록되면 미리 로드가 됨") }
   
   var body: some View {
      VStack {
         Image(systemName: "star").resizable().frame(width: 100, height: 100)
         NavigationLink { NavigatingViewWrapper(PushedView2()) } label: { Text("이동됨~") }
      }
      .navigationTitle("second view")
   }
}

struct PushedView2: View {
   
   init() { print("등록되면 미리 로드가 됨2") }
   
   var body: some View {
      Text("이동됨2~")
   }
}

#Preview {
   NavigationView1()
}

// 랜더 시점에 네비게이션 이동 액션이 없더라도, 다음 화면의 랜더링이 준비된다. (다음 view 객체가 init됨)
// -> init 시점에 네트워크 통신이 있으면 baam
