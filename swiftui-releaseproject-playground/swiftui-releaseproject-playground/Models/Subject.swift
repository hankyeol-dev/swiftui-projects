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
   var title: String
   
   @Persisted
   var thinks: List<Think>
   
   @Persisted
   var isSystemSubject: Bool = false
   
   @Persisted
   var createdAt: Date = .init()
   
   @Persisted
   var updatedAt: Date = .init()
   
   convenience init(
      title: String
   ) {
      self.init()
      
      self.title = title
   }
   
   var bySubjectItem: SubjectItem {
      return .init(id: _id.stringValue, subject: title, isSelected: false)
   }
}
