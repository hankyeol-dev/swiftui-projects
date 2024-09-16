//
//  ThinkPoint.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/16/24.
//

import Foundation
import RealmSwift

final class ThinkPoint: Object, ObjectKeyIdentifiable {
   enum PointType: Int {
      case increase
      case decrease
   }
   
   @Persisted(primaryKey: true)
   var _id: ObjectId
   
   @Persisted
   var point: Int
   
   @Persisted
   var accumulated: Int
   
   @Persisted
   var pointType: Int
   
   @Persisted
   var descript: String
   
   @Persisted
   var createdAt: Date = .now
   
   @Persisted
   var updatedAt: Date = .now
   
   var pointTypeConverter: PointType {
      guard let type = PointType(rawValue: pointType) else { return .increase }
      return type
   }
   
   convenience init(
      point: Int,
      accumulated: Int,
      pointType: Int,
      descript: String
   ) {
      self.init()
      self.point = point
      self.accumulated = accumulated
      self.pointType = pointType
      self.descript = descript
   }
}
