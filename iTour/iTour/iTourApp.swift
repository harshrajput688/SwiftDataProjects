//
//  iTourApp.swift
//  iTour
//
//  Created by Harsh Rajput on 16/06/25.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
