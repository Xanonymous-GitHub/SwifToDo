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

    @State private var _isBeingProcessed = false

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
                .disabled(_isBeingProcessed)
            FormTextField(hintText: "Email", textContent: $_email)
                .disabled(_isBeingProcessed)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
                .disabled(_isBeingProcessed)
            FormTextField(hintText: "Password", textContent: $_password2, isSecure: true)
                .disabled(_isBeingProcessed)

            Button {
                // TODO: remove DEV code.
                _isBeingProcessed = true
            } label: {
                if _isBeingProcessed {
                    ProgressView()
                } else {
                    Text("SignUp")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(FormMainActivityButtonStyle())
            .disabled(_isBeingProcessed)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
                .disabled(_isBeingProcessed)
            }
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
