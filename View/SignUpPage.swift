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

    @Environment(\.injected) var injected: DIContainer
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var state: SignUpPageState

    var body: some View {
        let authInteractor = injected.interactors.authInteractor

        VStack {
            HStack {
                Text("Join Us!")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            .padding()

            FormTextField(hintText: "Name", textContent: $_username)
                .disabled(state.isLoading)
            FormTextField(hintText: "Email", textContent: $_email)
                .disabled(state.isLoading)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
                .disabled(state.isLoading)
            FormTextField(hintText: "Password", textContent: $_password2, isSecure: true)
                .disabled(state.isLoading)

            Button {
                authInteractor.signUp(credentials: SignUpCredentials(userName: _username, email: _email, password: _password))
            } label: {
                if state.isLoading {
                    ProgressView()
                } else {
                    Text("SignUp")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(FormMainActivityButtonStyle())
            .disabled(state.isLoading)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
                .disabled(state.isLoading)
            }
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
            .inject(.new())
    }
}
