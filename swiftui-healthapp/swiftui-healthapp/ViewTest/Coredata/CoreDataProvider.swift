//
//  CoreDataProvider.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import Foundation
import CoreData

final class CoreDataProvider {
   
   static let shared: CoreDataProvider = .init()
   let persistentContainer: NSPersistentContainer
   
   private init() {
      persistentContainer = .init(name: "RemindersModel")
      persistentContainer.loadPersistentStores { descript, error in
         if let error {
            print(error)
         }
      }
   }
   
}
