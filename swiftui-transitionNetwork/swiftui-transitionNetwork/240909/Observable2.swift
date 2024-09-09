//
//  Observable2.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI

struct Observable2: View {
   /**
    - View에서 ViewModel 인스턴스 자체를 State로 가지고 있으면,
      그 내부의 멤버들의 값이 변경되었는지는 인지할 수 없다. (인스턴스 자체가 변경되어야 감지할 것)
    => @State wrapper가 아닌, @StateObject property wrapper로 해야함
    => ObservableObject 프로토콜을 따르는 객체 내부의 @Published 멤버의 변화를 감지하여 뷰를 업데이트 시키는 역할을 한다.
    => wwdc 2023 이후, Observable Macro를 통해 @State 로 관리가 가능해짐 (iOS 17+ 라서 버전 범용성이 조금 떨어짐)
    */
   
//   @State private var viewModel = Observable2ViewModel()
//   @StateObject fileprivate var viewModel: Observable2ViewModel
   @State fileprivate var viewModel: Observable2ViewModel
   
   var body: some View {
      VStack(alignment: .leading) {
         Text("밥알 \(viewModel.bob)개\n물방울 \(viewModel.mul)개")
         TextField("밥알", text: $viewModel.fieldText)
         TextField("물방울", text: $viewModel.fieldText2)
         Button {
            viewModel.eating()
         } label: { Text("밥 맥이기") }
         Button {
            viewModel.emitting()
         } label: { Text("배설하기") }
      }
      .padding(.horizontal, 36)
   }
}

@Observable
final fileprivate class Observable2ViewModel {
   /**
    @State는 뷰 객체에서 통용되는 상태 관리 목적의 property wrapper
    
    Viewmodel로 상태를 구분시키는건
    => @State 형태로 뷰를 관장하는게 아님
    => 뷰모델 클래스에서 활용할 상태 관리 property wrapper가 필요함
    
    ViewModel 인스턴스의 내부 멤버들이 변경되면
    - View가 그 값이 변경되었다는 것을 인지해야 함
      => View가 인스턴스만 참조하더라도, 내부 멤버 변화를 인지할 수 있는 키워드가 필요함.
      => 그게 바로 @Published
    */
   
//   @State var fieldText: String = ""
   var fieldText: String = ""
//   @State var fieldText2: String = ""
   var fieldText2: String = ""
//   @State var bob: Int = 0
   var bob: Int = 0
//   @State var mul: Int = 0
   var mul: Int = 0
   
   func eating() {
      if fieldText.isEmpty && fieldText2.isEmpty {
         bob += 1
         mul += 1
      } else {
         if let bobCount = Int(fieldText) {
            bob += bobCount
         }
         
         if let mulCount = Int(fieldText2) {
            mul += mulCount
         }
         
         fieldText = ""
         fieldText2 = ""
      }
   }
   
   func emitting() {
      if fieldText.isEmpty && fieldText2.isEmpty && bob > 0 && mul > 0 {
         bob -= 1
         mul -= 1
      } else {
         if let bobCount = Int(fieldText) {
            bob -= bobCount
         }
         
         if let mulCount = Int(fieldText2) {
            mul -= mulCount
         }
         
         fieldText = ""
         fieldText2 = ""
      }
   }
}



#Preview {
    Observable2(viewModel: Observable2ViewModel())
}
