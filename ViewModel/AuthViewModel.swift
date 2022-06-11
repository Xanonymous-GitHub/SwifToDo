//
//  AuthInteractor.swift
//  swiftodo
//
//  Created by TeU on 2022/6/8.
//

import FirebaseAuth
import Foundation

enum AuthStates {
    case initial
    case proccessing
    case success
    case signUpSuccess
    case failed
}

@MainActor class AuthViewModel: ObservableObject {
    private let _authRepository: AuthRepository

    @Published private(set) var state = AuthStates.initial
    var errMsg = ""
    var currentUser: User? { _authRepository.currentUser }

    init(authRepository: AuthRepository) {
        _authRepository = authRepository
    }

    func resetState() {
        state = .initial
    }

    func login(credentials: LoginCredentials) {
        state = .proccessing

        Task {
            do {
                try await _authRepository.login(email: credentials.email, password: credentials.password)
                if _authRepository.isLoggedin {
                    state = .success
                }
            } catch {
                errMsg = error.localizedDescription
                state = .failed
            }
        }
    }

    func signUp(credentials: SignUpCredentials) {
        state = .proccessing

        Task {
            do {
                try await _authRepository.signUp(username: credentials.userName, email: credentials.email, password: credentials.password)
                state = .signUpSuccess
            } catch {
                errMsg = error.localizedDescription
                state = .failed
            }
        }
    }
}
