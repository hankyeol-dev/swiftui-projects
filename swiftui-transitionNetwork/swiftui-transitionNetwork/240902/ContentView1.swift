//
//  ContentView1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct ContentView1: View {
   @State private var isSheetPresent: Bool = false
   @State private var isFullSheetPresent: Bool = false
   @State private var randomNumber: Int = 1
   
   // 런타임에서 View의 타입을 명확하게 특정하기 힘들 때 사용해볼 수 있는 요소들
    @ViewBuilder
   // AnyView
   fileprivate var starImage: some View {
      switch randomNumber {
      case 1...33:
         Text("number~: ViewBuilder로 해결")
      case 34...60:
         Image(systemName: "star.fill").foregroundStyle(.yellow)
      default:
         Image(systemName: "star.fill").foregroundStyle(.green)
      }
   }
   
   var body: some View {
      NavigationView {
         VStack {
            starImage.padding()
            
            Button {
               randomNumber = Int.random(in: 1...100)
            } label: {
               Text("랜덤 숫자 \(randomNumber)")
            }
            
            NavigationLink {
               ContentView1TransitionView()
            } label: {
               Text("navigation push").padding()
            }
            
            Button {
               isSheetPresent.toggle()
            } label: {
               Text("sheet present")
            }
            .padding()
            
            
            Button {
               isFullSheetPresent.toggle()
            } label: {
               Text("fullscreen present")
            }
            .padding()
         }
         .fullScreenCover(isPresented: $isFullSheetPresent) {
            ContentView1TransitionView()
         }
         .sheet(isPresented: $isSheetPresent) {
            ContentView1TransitionView()
         }
         .navigationTitle("화면 전환을 해보자")
         .navigationBarTitleDisplayMode(.inline)
      }
   }
}

fileprivate struct ContentView1TransitionView: View {
   // navigationLink를 사용할 경우,
   // 연결된 객체의 인스턴스가 push event 발생 전에 로드된다. (onAppear는 말 그대로 뷰가 떴을 때 동작)
   // MARK: => 연결된 view의 initalizer에 무거운 로직이 있으면 좋지 않을 수 있겠다.
   
   init() { }
   var body: some View {
      VStack {
         Text("transition view~")
            .onAppear {
               print("welcome")
            }
            .onDisappear {
               print("bye~")
            }
         Spacer().frame(height: 100)
         Button {
            
         } label: {
            Text("내리기")
         }
      }
   }
}

#Preview {
   ContentView1()
}

final class TestViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      // 전환하고자 하는 화면이 SwiftUI 코드 기반인 경우
      // -> UIHostingController를 활용한다.
      
      let vc = UIHostingController(rootView: ContentView1())
      present(vc, animated: true)
   }
}
