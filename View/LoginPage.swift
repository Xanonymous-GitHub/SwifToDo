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

    @State private var _isBeingProcessed = false

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
                .disabled(_isBeingProcessed)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
                .disabled(_isBeingProcessed)

            Button {
                // TODO: remove DEV code.
                _isBeingProcessed = true
            } label: {
                if _isBeingProcessed {
                    ProgressView()
                } else {
                    Text("Login")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(FormMainActivityButtonStyle())
            .disabled(_isBeingProcessed)

            HStack {
                Text("Not have an account?")
                    .foregroundColor(.secondary)

                Button {
                    _isSigningUp = true
                } label: {
                    Text("SignUp")
                }
                .disabled(_isBeingProcessed)
            }
        }
        .padding()
        .sheet(isPresented: $_isSigningUp) {
            NavigationView {
                SignUpPage()
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
