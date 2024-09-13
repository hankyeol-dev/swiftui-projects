//
//  Sub.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/13/24.
//

import Foundation
import RealmSwift

final class Sub: Object, ObjectKeyIdentifiable {
   @Persisted(primaryKey: true) 
   var _id: ObjectId
   
   @Persisted
   var title: String
   
   @Persisted
   var content: String
   
   @Persisted
   var isChecked: Bool = false
   
   @Persisted
   var createdAt: Date = .now
   
   @Persisted
   var updatedAt: Date = .now
}
