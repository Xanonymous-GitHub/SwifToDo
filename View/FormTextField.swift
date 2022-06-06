//
//  FormTextField.swift
//  swiftodo
//
//  Created by TeU on 2022/6/7.
//

import SwiftUI

struct FormTextField: View {
    let hintText: String
    let textContent: Binding<String>
    var isSecure = false

    var body: some View {
        HStack {
            if isSecure {
                SecureField(hintText, text: textContent)
            } else {
                TextField(hintText, text: textContent)
            }
        }
        .padding()
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
        .cornerRadius(15)
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(hintText: "General", textContent: .constant("test"))
            .previewLayout(.sizeThatFits)

        FormTextField(hintText: "Secure", textContent: .constant("test"), isSecure: true)
            .previewLayout(.sizeThatFits)
    }
}
