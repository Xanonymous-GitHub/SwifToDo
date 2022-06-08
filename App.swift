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

    @StateObject private var _authViewModel = AuthViewModel(authRepository: AuthRepositoryImpl())

    var body: some Scene {
        WindowGroup {
            UIPilotHost(_pilot)  { route in
                switch route {
                case .HomePage:
                    return AnyView(
                        EventList()
                            .environmentObject(_eventData)
                            .environmentObject(_authViewModel)
                    )
                case .LoginPage:
                    return AnyView(
                        LoginPage()
                            .environmentObject(_authViewModel)
                    )
                }
            }
        }
    }
}
