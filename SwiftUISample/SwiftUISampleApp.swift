//
//  SwiftUISampleApp.swift
//  SwiftUISample
//
//  Created by haram on 1/3/25.
//

import SwiftUI

@main
struct SwiftUISampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
