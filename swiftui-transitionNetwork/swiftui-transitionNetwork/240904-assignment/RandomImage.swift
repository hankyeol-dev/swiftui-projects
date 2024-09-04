//
//  RandomImage.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/4/24.
//

import SwiftUI

struct SectionModel: Hashable {
   var title: String
   let images: [String] = (0...9).map { _ in "https://picsum.photos/200/300" }
}

struct RandomImage: View {
   
   @State private var sections: [SectionModel] = (0...4).map {
      .init(title: "\($0)번째 섹션")
   }
   
   var body: some View {
      NavigationView {
         ScrollView {
            ForEach($sections, id: \.title) { section in
               RandomImageSectionView(section: section)
            }
         }
      }
   }
}

struct RandomImageSectionView: View {
   @Binding fileprivate var section: SectionModel
   
   var body: some View {
      VStack {
         HStack {
            Text(String(section.title))
            Spacer()
         }
         Spacer()
         ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
               ForEach(section.images, id: \.self) { image in
                  VStack {
                     AsyncImage(url: URL(string: image)) { img in
                        switch img {
                        case .empty:
                           ProgressView()
                              .frame(width: 300, height: 300)
                        case .success(let image):
                           image.resizable().frame(width: 200, height: 300)
                        case .failure(let error):
                           Rectangle().background(.gray).frame(width: 200, height: 300)
                        @unknown default:
                           Rectangle().background(.gray).frame(width: 200, height: 300)
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

#Preview {
   RandomImage()
}

/**
 sectionTitle: String
 sectionImages: ["picsum", ~~ ]
 
 */
