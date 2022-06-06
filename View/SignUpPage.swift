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
            FormTextField(hintText: "Email", textContent: $_email)
            FormTextField(hintText: "Password", textContent: $_password, isSecure: true)
            FormTextField(hintText: "Password", textContent: $_password2, isSecure: true)

            Button {

            } label: {
                Text("SignUp")
                    .fontWeight(.bold)
            }
            .buttonStyle(FormMainActivityButtonStyle())
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
