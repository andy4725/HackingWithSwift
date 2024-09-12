//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Endre Imecs on 7/23/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
