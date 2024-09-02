//
//  OnboardingView.swift
//  swiftui-photobox-refactor
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
   var body: some View {
      NavigationView {
         VStack {
            Spacer()
               .frame(height: 56)
            Image(.launchLetter)
            Spacer()
               .frame(height: 16)
            Image(.launch)
            Spacer().frame(height: 36)
            NavigationLink {
               ProfileSettingView()
                  .navigationTitle("프로필 설정")
                  .navigationBarTitleDisplayMode(.inline)

            } label: {
               Text("시작하기")
                  .asCapsuledView(backgroundC: .blue, width: 300, height: 48)
            }
            Spacer().frame(height: 16)
         }
         .padding()
      }
   }
}

#Preview {
   OnboardingView()
}
