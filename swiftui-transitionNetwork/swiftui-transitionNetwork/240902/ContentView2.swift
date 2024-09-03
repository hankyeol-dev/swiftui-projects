//
//  ContentView2.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct CardViewModel: Hashable, Identifiable {
   let id: UUID = UUID()
   let color: Color = .init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
   let height: CGFloat = 140
   let index: Int
}

struct ContentView2: View {
   @State private var isAnimationOn: Bool = false
   
   private let cardList = (0...6).map({ num in CardViewModel(index: num) })
   
   var body: some View {
      VStack {
         HStack {
            SlideTitle(isAnimationOn: $isAnimationOn)
            
            if isAnimationOn {
               SlideButton(isAnimationOn: $isAnimationOn)
                  .padding(.trailing, 24)
            }
         }.padding(.vertical, 16)
         
         ScrollView {
            ForEach(cardList, id: \.id) { cardModel in
               SlideCardView(cardViewModel: cardModel, isAnimationOn: $isAnimationOn)
            }
         }
         
         Spacer()
         
         Button("animation \(isAnimationOn ? "off" : "on")") {
            withAnimation(.bouncy(duration: 0.89)) {
               isAnimationOn.toggle() // State가 변경되는 시점에 특정 애니메이션이 돌도록 처리한다.
            }
         }
      }
   }
}

fileprivate struct SlideCardView: View {
   fileprivate let cardViewModel: CardViewModel
   @Binding fileprivate var isAnimationOn: Bool
   @State fileprivate var isCardTouched: Bool = false
   
   var body: some View {
      VStack {
         RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(cardViewModel.color)
            .frame(width: .infinity, height: cardViewModel.height)
            .padding(.horizontal, 16)
//            .padding(.bottom, isAnimationOn ? 8 : -cardViewModel.height/2)
            .padding(.bottom, 4)
            .offset(y: !isAnimationOn ? CGFloat(cardViewModel.index) * -70 : 0)
            .onTapGesture {
               withAnimation {
                  isCardTouched.toggle()
               }
            }
         
         if isAnimationOn && isCardTouched {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
               .fill(.gray)
               .frame(width: .infinity, height: cardViewModel.height * 3)
               .padding(.horizontal, 16)
               .padding(.bottom, 12)
         }
      }
   }
}

fileprivate struct SlideButton: View {
   @Binding fileprivate var isAnimationOn: Bool
   
   fileprivate var body: some View {
      Button {
         withAnimation {
            isAnimationOn.toggle()
         }
      } label: {
         Image(systemName: "plus")
            .padding()
            .foregroundStyle(.white)
            .background(.black)
            .clipShape(Circle())
      }
      .rotationEffect(.degrees(isAnimationOn ?  45 : 0))
   }
}

fileprivate struct SlideTitle: View {
   @Binding fileprivate var isAnimationOn: Bool
   
   fileprivate var body: some View {
      Text("Title")
         .font(.system(size: isAnimationOn ? 24 : 32, weight: isAnimationOn ? .semibold : .bold))
         .frame(maxWidth: .infinity, alignment: isAnimationOn ? .leading : .center)
         .padding(.leading, isAnimationOn ? 24 : 0)
//         .overlay(alignment: .trailing) {
//            SlideButton(isAnimationOn: $isAnimationOn)
//         }
   }
}



#Preview {
   ContentView2()
}
