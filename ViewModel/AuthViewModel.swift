//
//  AuthController.swift
//  swiftodo
//
//  Created by TeU on 2022/6/7.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    private let _auth = Auth.auth()

    var currentUser: User? {
        _auth.currentUser
    }

    var isLoggedin: Bool {
        currentUser != nil
    }

    func login(email: String, password: String) async throws {
        try await _auth.signIn(withEmail: email, password: password)
    }

    func signUp(username: String, email: String, password: String) async throws {
        try await _auth.createUser(withEmail: email, password: password)

        let profileChangeReq = _auth.currentUser?.createProfileChangeRequest()
        profileChangeReq?.displayName = username
        try await profileChangeReq?.commitChanges()
    }
}
