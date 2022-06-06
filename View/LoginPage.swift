//
//  LoginPage.swift
//  swiftodo
//
//  Created by TeU on 2022/6/7.
//

import SwiftUI

struct LoginPage: View {
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            HStack {
                Text("Welcome!")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            .padding()

            HStack {
                TextField("Email", text: $username)
            }
            .padding()
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
            .cornerRadius(15)

            HStack {
                SecureField("Password", text: $password)
            }
            .padding()
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
            .cornerRadius(15)

            Button {

            } label: {
                Text("Login")
                    .fontWeight(.bold)
            }
            .buttonStyle(LoginButtonStyle())

            HStack {
                Text("Not have an account?")
                    .foregroundColor(.secondary)

                Button {

                } label: {
                    Text("SignUp")
                }
            }
        }
        .padding()
    }
}

struct LoginButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.vertical], 8)
            .frame(minWidth: UIScreen.screenWidth * 0.6)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
