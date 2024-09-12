//
//  TodoRealm.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import Foundation
import RealmSwift

final class TodoItem: Object, ObjectKeyIdentifiable {
   @Persisted(primaryKey: true) var id: ObjectId
   @Persisted(indexed: true) var isCompleted: Bool = false
   @Persisted var todo: String
   
   convenience init(isCompleted: Bool = false, todo: String) {
      self.init()
      
      self.isCompleted = isCompleted
      self.todo = todo
   }
}
