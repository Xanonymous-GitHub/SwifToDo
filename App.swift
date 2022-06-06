//
//  swiftodoApp.swift
//  Shared
//
//  Created by TeU on 2022/6/5.
//

import SwiftUI

@main
struct swiftodoApp: App {
    @StateObject private var eventData = EventData()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
        }
    }
}
