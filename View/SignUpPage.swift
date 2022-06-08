//
//  SignUpPage.swift
//  swiftodo
//
//  Created by TeU on 2022/6/7.
//

import SwiftUI

struct SignUpPage: View {
    @State private var _username: String = ""
    @State private var _email: String = ""
    @State private var _password: String = ""
    @State private var _password2: String = ""
    @State private var presentAlert = false

    @EnvironmentObject private var _viewModel: AuthViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack {
                Text("Join Us!")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            .padding()

            FormTextField(hintText: "Name", textContent: $_username)
                .disabled(_viewModel.state == .proccessing)
            FormTextField(hintText: "Email", textContent: $_email)
                .disabled(_viewModel.state == .proccessing)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
                .disabled(_viewModel.state == .proccessing)
            FormTextField(hintText: "Password", textContent: $_password2, isSecure: true)
                .disabled(_viewModel.state == .proccessing)

            Button {
                _viewModel.signUp(credentials: SignUpCredentials(userName: _username, email: _email, password: _password))
            } label: {
                if _viewModel.state == .proccessing {
                    ProgressView()
                } else {
                    Text("SignUp")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(FormMainActivityButtonStyle())
            .disabled(_viewModel.state == .proccessing)
            .onReceive(_viewModel.$state) { state in
                if state == .signUpSuccess {
                    _viewModel.resetState()
                    dismiss()
                } else if state == .failed {
                    presentAlert = true
                }
            }
            .alert("SignUp Failed", isPresented: $presentAlert, actions: {
                Button("OK") {
                    presentAlert = false
                }
            }, message: {
                Text(_viewModel.errMsg)
            })
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    _viewModel.resetState()
                    dismiss()
                }
                .disabled(_viewModel.state == .proccessing)
            }
        }
    }
}
