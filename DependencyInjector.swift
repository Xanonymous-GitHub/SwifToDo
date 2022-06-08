//
//  DependencyInjector.swift
//  swiftodo
//
//  Created by TeU on 2022/6/8.
//

import Foundation
import SwiftUI

struct DIContainer: EnvironmentKey {
    let interactors: Interactors

    static var defaultValue: Self { Self.new }
    private static let new = Self(interactors: .new())

    private static let _authRepository = AuthRepositoryImpl()
    static let loginPageState = LoginPageState()
    static let signUpPageState = SignUpPageState()
}

extension DIContainer {
    struct Interactors {
        static func new() -> Self { .init() }

        let authInteractor: AuthInteractor

        init() {
            authInteractor = AuthInteractorImpl(
                authRepository: _authRepository,
                loginPageState: loginPageState,
                signUpPageState: signUpPageState
            )
        }
    }
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

extension View {
    func inject(_ interactors: DIContainer.Interactors) -> some View {
        let container = DIContainer(interactors: interactors)
        return inject(container)
    }

    func inject(_ container: DIContainer) -> some View {
        self
            .environment(\.injected, container)
    }
}
