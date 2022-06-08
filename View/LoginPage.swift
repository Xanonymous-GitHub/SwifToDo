//
//  LoginPage.swift
//  swiftodo
//
//  Created by TeU on 2022/6/7.
//

import SwiftUI
import UIPilot

struct LoginPage: View {
    @State private var _email: String = ""
    @State private var _password: String = ""
    @State private var _isSigningUp = false
    @State private var presentAlert = false

    @EnvironmentObject private var _viewModel: AuthViewModel
    @EnvironmentObject private var _pilot: UIPilot<AppRoute>

    var body: some View {
        VStack {
            HStack {
                Text("Welcome!")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            .padding()

            FormTextField(hintText: "Email", textContent: $_email)
                .disabled(_viewModel.state == .proccessing)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
                .disabled(_viewModel.state == .proccessing)

            Button {
                _viewModel.login(credentials: LoginCredentials(email: _email, password: _password))
            } label: {
                if _viewModel.state == .proccessing {
                    ProgressView()
                } else {
                    Text("Login")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(FormMainActivityButtonStyle())
            .disabled(_viewModel.state == .proccessing)
            .onReceive(_viewModel.$state) { state in
                if state == .success {
                    _email.removeAll()
                    _password.removeAll()
                    
                    _pilot.push(.HomePage)
                } else if state == .failed {
                    presentAlert = true
                }
            }
            .alert("Login Failed", isPresented: $presentAlert, actions: {
                Button("OK") {
                    presentAlert = false
                }
            }, message: {
                Text(_viewModel.errMsg)
            })

            HStack {
                Text("Not have an account?")
                    .foregroundColor(.secondary)

                Button {
                    _isSigningUp = true
                } label: {
                    Text("SignUp")
                }
                .disabled(_viewModel.state == .proccessing)
            }
        }
        .padding()
        .sheet(isPresented: $_isSigningUp) {
            NavigationView {
                SignUpPage()
            }
        }
        .onAppear {
            _viewModel.resetState()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    @StateObject private static var _authViewModel = AuthViewModel(authRepository: AuthRepositoryImpl())

    static var previews: some View {
        LoginPage()
            .environmentObject(_authViewModel)
    }
}
