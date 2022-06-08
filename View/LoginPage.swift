//
//  LoginPage.swift
//  swiftodo
//
//  Created by TeU on 2022/6/7.
//

import SwiftUI

struct LoginPage: View {
    @State private var _email: String = ""
    @State private var _password: String = ""
    @State private var _isSigningUp = false

    @Environment(\.injected) var injected: DIContainer
    @EnvironmentObject var state: LoginPageState

    var body: some View {
        VStack {
            let authInteractor = injected.interactors.authInteractor

            HStack {
                Text("Welcome!")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            .padding()

            FormTextField(hintText: "Email", textContent: $_email)
                .disabled(state.isLoading)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
                .disabled(state.isLoading)

            Button {
                authInteractor.login(credentials: LoginCredentials(email: _email, password: _password))
            } label: {
                if state.isLoading {
                    ProgressView()
                } else {
                    Text("Login")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(FormMainActivityButtonStyle())
            .disabled(state.isLoading)

            HStack {
                Text("Not have an account?")
                    .foregroundColor(.secondary)

                Button {
                    _isSigningUp = true
                } label: {
                    Text("SignUp")
                }
                .disabled(state.isLoading)
            }
        }
        .padding()
        .sheet(isPresented: $_isSigningUp) {
            NavigationView {
                SignUpPage(state: SignUpPageState())
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .inject(.new())
    }
}
