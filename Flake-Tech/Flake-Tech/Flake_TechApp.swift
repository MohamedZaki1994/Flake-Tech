//
//  Flake_TechApp.swift
//  Flake-Tech
//
//  Created by Mohamed Zaki on 22/09/2021.
//

import SwiftUI

@main
struct Flake_TechApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
