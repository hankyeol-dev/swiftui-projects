//
//  ProfileImageSelectionView.swift
//  swiftui-photobox-refactor
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct ProfileImageSelectionView: View {
   @Binding var selectedProfileImage: ProfileImageModel
   @Binding var profileImageResources: [ProfileImageModel]
   var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
   
   var body: some View {
      VStack {
         Spacer().frame(height: 24)
         ProfileImageView(profileImageModel: $selectedProfileImage)
            .padding(.bottom, 48)
         LazyVGrid(columns: columns) {
            ForEach($profileImageResources, id: \.id) { profileImage in
               ProfileImageView(profileImageModel: profileImage)
            }
         }
         .padding()
         Spacer()
      }
   }
}

#Preview {
   let selectedProfileImage: ProfileImageModel = ProfileImageModel(id: "0", imageResource: "profile0", isModifyObject: true, isSelected: true, width: 130, height: 130)
   let profileImageResources: [ProfileImageModel] = (0...11).map({ num in "profile\(num)" }).enumerated().map { index, profile in
         .init(id: String(index), imageResource: profile, isModifyObject: false, isSelected: false, width: 80, height: 80)
   }
   return ProfileImageSelectionView(
      selectedProfileImage: .constant(selectedProfileImage),
      profileImageResources: .constant(profileImageResources)
   )
}
