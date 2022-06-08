//
//  LoginPageState.swift
//  swiftodo
//
//  Created by TeU on 2022/6/8.
//

import Foundation

class LoginPageState: ObservableObject {
    @Published var isLoading = false
    @Published var loginErrorMsg = ""
}
