//
//  AuthInteractor.swift
//  swiftodo
//
//  Created by TeU on 2022/6/8.
//

import Foundation

protocol AuthInteractor {
    func login(credentials: LoginCredentials)
    func signUp(credentials: SignUpCredentials)
}

struct AuthInteractorImpl: AuthInteractor {
    private let _authRepository: AuthRepository
    private let _loginPageState: LoginPageState
    private let _signUpPageState: SignUpPageState

    init(
        authRepository: AuthRepository,
        loginPageState: LoginPageState,
        signUpPageState: SignUpPageState
    ) {
        _authRepository = authRepository
        _loginPageState = loginPageState
        _signUpPageState = signUpPageState
    }

    func login(credentials: LoginCredentials) {
        _loginPageState.isLoading = true

        Task {
            do {
                try await _authRepository.login(email: credentials.email, password: credentials.password)
            } catch {
                _loginPageState.loginErrorMsg = error.localizedDescription
            }
        }

        _loginPageState.isLoading = false
    }

    func signUp(credentials: SignUpCredentials) {
        _signUpPageState.isLoading = true

        Task {
            do {
                try await _authRepository.signUp(username: credentials.userName, email: credentials.email, password: credentials.password)
            } catch {
                _signUpPageState.signUpErrorMsg = error.localizedDescription
            }
        }

        _signUpPageState.isLoading = false
    }
}
