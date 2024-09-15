//
//  +Realm.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/14/24.
//

import Foundation
import RealmSwift

struct RealmHelper {
   static func getRealmFileURL() -> URL? {
      return Realm.Configuration.defaultConfiguration.fileURL
   }
}

final class RealmManager: ObservableObject {
   
   static let manager: RealmManager = .init()
   
   private var config: Realm.Configuration
   private let db: Realm
   
   private init() {
      config = Realm.Configuration()
      config.schemaVersion = 1
      
      db = try! Realm(configuration: config)
   }
   
   func getDBConfig() -> Realm.Configuration { return config }
   
}
