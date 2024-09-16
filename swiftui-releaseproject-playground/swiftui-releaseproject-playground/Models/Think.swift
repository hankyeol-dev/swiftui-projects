//
//  Think.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/13/24.
//

import Foundation
import RealmSwift

final class Think: Object, ObjectKeyIdentifiable {
   
   enum ThinkingType: Int, CaseIterable {
      case stay
      case walk
      case run
      
      var byIcons: ImageResource {
         switch self {
         case .stay:
               .sit
         case .walk:
               .walk
         case .run:
               .run
         }
      }
      
      var byKoreanName: String {
         switch self {
         case .stay:
            "앉아서"
         case .walk:
            "걸으면서"
         case .run:
            "달리면서"
         }
      }
   }
   
   @Persisted(primaryKey: true)
   var _id: ObjectId
   
   @Persisted(indexed: true)
   var date: Date
   
   @Persisted(originProperty: "thinks")
   var subject: LinkingObjects<Subject>
   
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
         guard let thinkingType = ThinkingType(rawValue: thinkType) else { return .stay }
         return thinkingType
      }
      
      set {
         thinkType = newValue.rawValue
      }
   }
}

