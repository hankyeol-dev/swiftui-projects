//
//  RandomImage.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/4/24.
//

import SwiftUI

struct SectionImageModel: Hashable {
   let id: UUID = UUID()
   let url: String = "https://picsum.photos/200/300"
}

struct SectionModel: Hashable {
   var title: String
   let images: [SectionImageModel] = (0...9).map { _ in SectionImageModel() }
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
               ForEach(section.images, id: \.id) { image in
                  NavigationLink {
                     RandomImageDetailView(sectionTitle: $section.title)
                  } label: {
                     RandomImageView(imageURL: image.url)
                  }
               }
            }
         }
      }
   }
}

struct RandomImageView: View {
   fileprivate let imageURL: String
   
   var body: some View {
      AsyncImage(url: URL(string: imageURL)) { img in
         switch img {
         case .empty:
            ProgressView()
               .frame(width: 300, height: 300)
         case .success(let image):
            image.resizable().frame(width: 200, height: 300)
         case .failure:
            Rectangle().background(.gray).frame(width: 200, height: 300)
         @unknown default:
            Rectangle().background(.gray).frame(width: 200, height: 300)
         }
      }
   }
}

struct RandomImageDetailView: View {
   @Binding fileprivate var sectionTitle: String
   
   var body: some View {
      TextField("바꿔", text: $sectionTitle)
   }
}

#Preview {
   RandomImage()
}

/**
 sectionTitle: String
 sectionImages: ["picsum", ~~ ]
 
 */
