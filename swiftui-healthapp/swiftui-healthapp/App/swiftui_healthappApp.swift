//
//  swiftui_healthappApp.swift
//  swiftui-healthapp
//
//  Created by 강한결 on 9/9/24.
//

import SwiftUI
import MijickNavigationView

@main
struct swiftui_healthappApp: App {
   
   var body: some Scene {
      WindowGroup {
         RealmTestView()
            .implementNavigationView(config: navigationConfig)
      }
   }
}

extension swiftui_healthappApp {
   var navigationConfig: NavigationGlobalConfig {
      var config = NavigationGlobalConfig()
      config.backgroundColour = .white
      return config
   }
}
