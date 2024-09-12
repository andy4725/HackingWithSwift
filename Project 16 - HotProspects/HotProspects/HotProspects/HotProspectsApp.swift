//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Endre Imecs on 8/19/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Prospect.self)
        }
    }
}
