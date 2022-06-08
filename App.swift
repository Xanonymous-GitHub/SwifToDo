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
    @StateObject private var _eventData = EventData()
    @StateObject private var _pilot = UIPilot(initial: AppRoute.LoginPage)

    private let _diContainer = DIContainer(interactors: .new())

    var body: some Scene {
        WindowGroup {
            UIPilotHost(_pilot)  { route in
                switch route {
                case .HomePage:
                    return AnyView(
                        NavigationView {
                            EventList()
                            Text("Select an Event")
                                .foregroundStyle(.secondary)
                        }.environmentObject(_eventData)
                    )
                case .LoginPage:
                    return AnyView(
                        LoginPage()
                            .inject(_diContainer)
                    )
                }
            }
        }
    }
}
