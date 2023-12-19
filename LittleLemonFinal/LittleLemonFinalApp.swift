//
//  LittleLemonFinalApp.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

@main
struct LittleLemonFinalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
