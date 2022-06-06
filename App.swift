//
//  swiftodoApp.swift
//  Shared
//
//  Created by TeU on 2022/6/5.
//

import SwiftUI
import FirebaseCore
import UIPilot

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }

}

enum AppRoute: Equatable {
    case HomePage
    case LoginPage
}


@main
struct swiftodoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var eventData = EventData()
    @StateObject private var pilot = UIPilot(initial: AppRoute.LoginPage)

    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot)  { route in
                switch route {
                case.HomePage:
                    return AnyView(
                        NavigationView {
                            EventList()
                            Text("Select an Event")
                                .foregroundStyle(.secondary)
                        }.environmentObject(eventData)
                    )
                case .LoginPage:
                    return AnyView(LoginPage())
                }
            }
        }
    }
}
