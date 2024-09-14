//
//  swiftui_releaseproject_playgroundApp.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import SwiftUI

import RealmSwift

@main
struct swiftui_releaseproject_playgroundApp: App {
   
   var body: some Scene {
      WindowGroup {
         Home()
            .task {
               setRealmSchema()
            }
      }
   }
   
   private func setRealmSchema() {
      Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
   }
}
