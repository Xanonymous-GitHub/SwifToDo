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
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)

            Button {

            } label: {
                Text("Login")
                    .fontWeight(.bold)
            }
            .buttonStyle(FormMainActivityButtonStyle())

            HStack {
                Text("Not have an account?")
                    .foregroundColor(.secondary)

                Button {
                    _isSigningUp = true
                } label: {
                    Text("SignUp")
                }
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
