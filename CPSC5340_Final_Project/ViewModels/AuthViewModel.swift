//
//  AuthModel.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/14/24.
//

import SwiftUI


class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn: Bool = false
    @Published var error: AuthModelError?
    @Published var hasError = false

    private let authModel: AuthModel

    init(authModel: AuthModel = AuthModel()) {
        self.authModel = authModel
    }

    func login() {
        authModel.login(email: email, password: password) { result in
            switch result {
            case .success:
                self.error = nil
                self.isLoggedIn = true
                self.hasError = false
            case .failure(let error):
                self.error = error
                self.isLoggedIn = false
                self.hasError = true
            }
        }
    }

    func register() {
        authModel.register(email: email, password: password) { result in
            switch result {
            case .success:
                self.error = nil
                self.isLoggedIn = true
                self.hasError = false
            case .failure(let error):
                self.error = error
                self.isLoggedIn = false
                self.hasError = true
            }
        }
    }

    func logout() {
        authModel.logout { result in
            switch result {
            case .success:
                self.isLoggedIn = false
                self.hasError = false
            case .failure(let error):
                print("Logout error: \(error.localizedDescription)")
                self.hasError = true
            }
        }
    }
}

