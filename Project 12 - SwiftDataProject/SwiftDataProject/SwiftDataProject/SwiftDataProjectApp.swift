//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Endre Imecs on 7/24/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
