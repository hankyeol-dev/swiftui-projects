//
//  Think.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import Foundation
import RealmSwift

final class Think: Object, ObjectKeyIdentifiable {
   
   enum ThinkingType: Int {
      case stay
      case walk
      case run
      case none
   }
   
   @Persisted(primaryKey: true)
   var _id: ObjectId
   
   @Persisted(indexed: true)
   var date: Date
   
   @Persisted
   var subject: Subject?
   
   @Persisted
   var subs: List<Sub>
   
   @Persisted
   var smartList: List<SmartList>
   
   @Persisted
   var content: String
   
   @Persisted
   var thinkType: Int = ThinkingType.stay.rawValue
   
   @Persisted
   var timeTake: Int = 0
   
   @Persisted
   var isTemplate: Bool = false
   
   @Persisted
   var isSaved: Bool = false
   
   @Persisted
   var createdAt: Date = .init()
   
   @Persisted
   var updatedAt: Date = .init()
   
   
   var thinkTypeConverter: ThinkingType {
      get {
         guard let thinkingType = ThinkingType(rawValue: thinkType) else { return .none }
         return thinkingType
      }
      
      set {
         thinkType = newValue.rawValue
      }
   }
}

