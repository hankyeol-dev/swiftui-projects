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
   
}
