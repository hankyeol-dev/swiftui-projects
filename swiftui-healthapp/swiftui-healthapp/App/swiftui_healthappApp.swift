//
//  swiftui_healthappApp.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI
import CoreData

@main
struct swiftui_healthappApp: App {
   
   var body: some Scene {
      WindowGroup {
         CoreDataTestView()
//            .environment(\.managedObjectContext, viewContext)
      }
   }
}
