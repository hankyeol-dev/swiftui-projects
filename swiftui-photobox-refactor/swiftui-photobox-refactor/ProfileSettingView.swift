//
//  ProfileSettingView.swift
//  swiftui-photobox-refactor
//
//  Created by 강한결 on 9/2/24.
//

import SwiftUI

struct ProfileMBTIModel: Hashable {
   let name: String
   var isSelected: Bool
}

struct ProfileImageModel: Hashable, Identifiable {
   let id: String
   let imageResource: String
   var isModifyObject: Bool
   var isSelected: Bool
   let width: CGFloat
   let height: CGFloat
}

struct ProfileSettingView: View {
   @State private var selectedProfileImageResource: ProfileImageModel = .init(
      id: "0",
      imageResource: (0...11).map { num in "profile\(num)" }.randomElement() ?? "",
      isModifyObject: true,
      isSelected: true,
      width: 130,
      height: 130)
   @State private var profileImageResources: [ProfileImageModel] = (0...11).map({ num in "profile\(num)" }).enumerated().map { index, profile in
         .init(id: String(index), imageResource: profile, isModifyObject: false, isSelected: false, width: 80, height: 80)
   }
   @State private var profileNicknameText: String = ""
   @State private var mbtis: [[ProfileMBTIModel]] = [["I", "E"], ["S","N"], ["F", "T"], ["P", "J"]].map { $0.map{ .init(name: $0, isSelected: false) } }
   
   var body: some View {
      VStack {
         Spacer().frame(height: 24)
         NavigationLink {
            ProfileImageSelectionView(
               selectedProfileImage: $selectedProfileImageResource,
               profileImageResources: $profileImageResources
            )
            .navigationTitle("프로필 이미지 선택")
         } label: {
            HStack(alignment: .bottom) {
               ProfileImageView(
                  profileImageModel: $selectedProfileImageResource
               )
               Image(systemName: "camera.fill")
                  .padding(.all, 12)
                  .background(.blue)
                  .foregroundStyle(.white)
                  .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                  .padding(.leading, -50)
                  .padding(.bottom, -5)
            }
            .padding(.bottom, 24)
         }
         
         TextField("닉네임을 입력해보삼", text: $profileNicknameText)
            .padding(.horizontal, 16)
         Rectangle()
            .frame(width: .infinity, height: 1.0)
            .background(.gray)
            .opacity(0.2)
            .padding(.horizontal, 16)
         Spacer().frame(height: 36)
         HStack(alignment: .top) {
            Text("MBTI").bold()
            Spacer()
            ProfileMBTIView(mbtis: $mbtis)
         }
         .padding(.horizontal, 16)
         
         Spacer()
         
         
         
         NavigationLink {
            
         } label: {
            Text("완료")
               .asCapsuledView(backgroundC: .blue, width: 300, height: 56)
         }
         
         Spacer().frame(height: 24)
      }
   }
     
}

struct ProfileImageView: View {
   @Binding var profileImageModel: ProfileImageModel
   
   var body: some View {
      Image(profileImageModel.imageResource, bundle: nil)
         .resizable()
         .aspectRatio(contentMode: .fill)
         .imageScale(.small)
         .frame(width: profileImageModel.width, height: profileImageModel.height)
         .clipShape(Circle())
         .overlay(profileImageModel.isSelected ? Circle().stroke(.blue, lineWidth: 5) : Circle().stroke(.black, lineWidth: 2))
         .opacity(profileImageModel.isSelected ? 1 : 0.6)
   }
}

struct ProfileMBTIView: View {
   @Binding fileprivate var mbtis: [[ProfileMBTIModel]]
   
   var body: some View {
      ForEach($mbtis, id: \.self) { mbtiGroup in
         HStack {
            MBTIButtonGroupView(mbtiGroup: mbtiGroup)
         }
      }
   }
}

struct MBTIButtonGroupView: View {
   @Binding fileprivate var mbtiGroup: [ProfileMBTIModel]
   
   var body: some View {
      VStack {
         ForEach(mbtiGroup, id: \.name) { mbti in
            Button {
               guard let index = mbtiGroup.firstIndex(of: mbti) else { return }
               
               mbtiGroup.enumerated().forEach { idx, item in
                  if idx != index {
                     if item.isSelected {
                        mbtiGroup[idx].isSelected = false
                        mbtiGroup[index].isSelected = true
                     }
                  } else {
                     if item.isSelected {
                        mbtiGroup[index].isSelected = false
                     } else {
                        mbtiGroup[index].isSelected = true
                     }
                  }
               }
            } label: {
               Text(mbti.name)
                  .padding(.all, 12)
                  .foregroundStyle(mbti.isSelected ? .blue : .black)
                  .font(mbti.isSelected ? .system(size: 15, weight: .semibold) : .system(size: 14, weight: .regular))
                  .frame(width: 32, height: 32)
                  .clipShape(Circle())
                  .overlay(mbti.isSelected ? Circle().stroke(.blue, lineWidth: 1) : Circle().stroke(.black, lineWidth: 1))
            }
         }
      }
   }
}

#Preview {
   ProfileSettingView()
}
