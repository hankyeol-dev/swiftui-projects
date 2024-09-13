//
//  SmartList.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/13/24.
//

import Foundation
import RealmSwift

final class SmartList: Object, ObjectKeyIdentifiable {
   @Persisted(primaryKey: true)
   var _id: ObjectId
   
   @Persisted
   var title: String
   
   /// String for emoji asset
   @Persisted
   var emoji: String
   
   @Persisted
   var descript: String?
   
   @Persisted
   var createdAt: Date = .now
   
   @Persisted
   var updatedAt: Date = .now
}
