//
//  SignUpPageState.swift
//  swiftodo
//
//  Created by TeU on 2022/6/8.
//

import Foundation

class SignUpPageState: ObservableObject {
    @Published var isLoading = false
    @Published var signUpErrorMsg = ""
}
