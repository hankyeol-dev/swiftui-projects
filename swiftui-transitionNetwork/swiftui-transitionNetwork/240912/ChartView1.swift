//
//  ChartView1.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI
import Charts

struct Movie: Hashable {
   let id: UUID = .init()
   let genre: String
   let count = Int.random(in: 1...40)
}

struct ChartView1: View {
   @Environment(\.colorScheme) private var colorScheme
   
   @State private var movies: [Movie] = dummyMovies
   
   var body: some View {
      VStack {
         Spacer().frame(height: 16)
         chartTitle
         Spacer().frame(height: 16)
         Chart(movies, id: \.id) { movie in
            RectangleMark(
               x: .value("genre", movie.genre),
               y: .value("count", movie.count))
         }
         .frame(width: .infinity, height: 200)
         .padding(.top, 16)
         .padding(.horizontal, 16)
         .chartYAxis(.hidden)
         .chartYAxis(.hidden)
         .foregroundStyle(colorScheme == .dark ? .blue : .red)
         
         
         Spacer()
      }
      
   }
   
   @ViewBuilder
   var chartTitle: some View {
      switch colorScheme {
      case .dark:
         Text("다크 차트").font(.title)
      case .light:
         Text("라이트 차트").foregroundStyle(.red).font(.caption)
      @unknown default:
         Text("차트")
      }
   }
}

#Preview {
   ChartView1()
}

let dummyMovies: [Movie] = ["action", "sf", "romace", "comedy", "thriller"].map {
   .init(genre: $0)
}
