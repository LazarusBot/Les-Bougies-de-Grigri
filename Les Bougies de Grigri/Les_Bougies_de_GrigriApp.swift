//
//  Les_Bougies_de_GrigriApp.swift
//  Les Bougies de Grigri
//
//  Created by Max Prx on 07/03/2023.
//

import SwiftUI

@main
struct Les_Bougies_de_GrigriApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
