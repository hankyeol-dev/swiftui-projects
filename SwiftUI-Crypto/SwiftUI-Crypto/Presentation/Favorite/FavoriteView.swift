//
//  FavoriteView.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import SwiftUI

struct FavoriteView: View {
   
   @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]
   @State private var draggingColor: Color?
   
   var body: some View {
      NavigationStack {
         ScrollView(.vertical) {
            let columns = Array(repeating: GridItem(spacing: 10), count: 3)
            LazyVGrid(columns: columns, spacing: 10, content: {
               ForEach(colors, id:\.self) { color in
                  GeometryReader {
                     let size = $0.size
                     RoundedRectangle(cornerRadius: 10)
                        .fill(color.gradient)
                        .draggable(color) {
                           RoundedRectangle(cornerRadius: 10)
                              .fill(.ultraThinMaterial)
                              .frame(width: size.width, height: size.height)
                              .onAppear {
                                 draggingColor = color
                              }
                        }
                        .dropDestination(for: Color.self) { items, location in
                           draggingColor = nil
                           return false
                        } isTargeted: { status in
                           if let draggingColor, status, draggingColor != color {
                              if let colorIndex = colors.firstIndex(of: draggingColor),
                                 let destinationIndex = colors.firstIndex(of: color) {
                                 withAnimation {
                                    let source = colors.remove(at: colorIndex)
                                    colors.insert(source, at: destinationIndex)
                                 }
                              }
                           }
                        }

                  }
                  .frame(height: 100)
               }
            })
            .padding()
         }
         .navigationTitle("DragAndDropGrid")
      }
   }
}

#Preview {
   FavoriteView()
}
