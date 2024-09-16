//
//  swiftui_releaseproject_playgroundApp.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

import RealmSwift
import MijickPopupView

@main
struct swiftui_releaseproject_playgroundApp: App {
   
   private let db = RealmManager.manager
   
   var body: some Scene {
      WindowGroup {
         Home()
            .implementPopupView()
            .environmentObject(db)
            .environment(\.realmConfiguration, db.getDBConfig())
            .task {
               db.getDBURL()
            }
      }
   }
}
