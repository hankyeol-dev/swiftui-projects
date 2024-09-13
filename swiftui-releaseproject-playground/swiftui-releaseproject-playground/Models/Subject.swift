//
//  Subject.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import Foundation
import RealmSwift

final class Subject: Object, ObjectKeyIdentifiable {
   @Persisted(primaryKey: true)
   var _id: ObjectId
   
   @Persisted
   var content: String
   
   @Persisted
   var thinks: List<Think>
   
   @Persisted
   var createdAt: Date = .init()
   
   @Persisted
   var updatedAt: Date = .init()
   
   convenience init(
      content: String
   ) {
      self.init()
      
      self.content = content
   }
}
