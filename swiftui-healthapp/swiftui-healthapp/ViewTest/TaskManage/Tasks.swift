//
//  Tasks.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/12/24.
//

import Foundation
import SwiftUI

struct TaskItem: Hashable, Identifiable {
   let id: UUID = .init()
   var title: String
   var caption: String
   var date: Date = .init()
   var isCompleted: Bool = false
   var tint: Color
}

//dummy Tasks

let dummyTasks: [TaskItem] = [
   .init(title: "Stand Up", caption: "everyday in hour", date: .now, tint: .yellow),
   .init(title: "Kick off", caption: "Travel App", tint: .gray),
   .init(title: "UI Design", caption: "Travel App Design", tint: .green),
   .init(title: "Logo Design", caption: "Fitness App", tint: .purple)
]
