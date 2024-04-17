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
    @Published var hasError: Bool = false
    @Published var alertType: AlertType?


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
                    self.alertType = .error(id: UUID())
                    print(error)
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
                    self.alertType = .error(id: UUID())
                    print(error)
            }
        }
    }
    
    func resetButton() {
        self.alertType = .passwordReset(id: UUID())
    }
    
    func resetPassword() {
        authModel.resetPassword(email: email){ result in
            switch result {
                case .success:
                    print("Password reset successful")
                case .failure(let error):
                    self.error = error
                    self.alertType = .error(id: UUID())
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
                    self.alertType = .error(id: UUID())
            }
        }
    }
}

extension AuthViewModel {
    enum AlertType: Identifiable {
        case error(id: UUID)
        case passwordReset(id: UUID)
        
        var id: UUID {
            switch self {
            case .error(let id), .passwordReset(let id):
                return id
            }
        }
        
        var description: String {
            switch self {
            case .error:
                return "Error alert"
            case .passwordReset:
                return "Password reset alert"
            }
        }
    }
}

