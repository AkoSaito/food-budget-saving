//
//  food_budget_savingApp.swift
//  food-budget-saving
//
//  Created by Ako Saito on 2022/06/11.
//

import SwiftUI

@main
struct food_budget_savingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
