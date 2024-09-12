//
//  CoreDataTestView.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import SwiftUI
import CoreData

struct CoreDataTestView: View {
   
   @FetchRequest(entity: Test.entity(), sortDescriptors: [])
   private var tests: FetchedResults<Test>
   
   var body: some View {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
   }
}

#Preview {
   CoreDataTestView()
}
