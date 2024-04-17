//
//  AuthViewModel.swift
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
                    self.handleSuccessfulLogin()
                case .failure(let error):
                    self.handleError(error)
            }
        }
    }
    
    func logout() {
        authModel.logout { result in
            switch result {
            case .success:
                self.handleSuccessfulLogout()
            case .failure(let error):
                print("Logout error: \(error.localizedDescription)")
                self.handleError(error as! AuthModelError)
            }
        }
    }

    func register() {
        authModel.register(email: email, password: password) { result in
            switch result {
                case .success:
                    self.handleSuccessfulLogin()
                case .failure(let error):
                    self.handleError(error)
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
                    self.alertType = .successfulPasswordReset(id: UUID())
                case .failure(let error):
                    self.handleError(error)
            }
        }
    }

    private func handleSuccessfulLogin() {
        self.error = nil
        self.isLoggedIn = true
        self.hasError = false
    }
        
    private func handleSuccessfulLogout() {
        self.error = nil
        self.isLoggedIn = false
        self.hasError = false
    }

    private func handleError(_ error: AuthModelError) {
        self.error = error
        self.isLoggedIn = false
        self.hasError = true
        self.alertType = .error(id: UUID())
        // for debugging purposes:
        print(error)
    }
}


extension AuthViewModel {
    enum AlertType: Identifiable {
        case error(id: UUID)
        case passwordReset(id: UUID)
        case successfulPasswordReset(id: UUID)
        
        var id: UUID {
            switch self {
            case .error(let id), .passwordReset(let id), .successfulPasswordReset(let id):
                return id
            }
        }
        
        var description: String {
            switch self {
            case .error:
                return "Error alert"
            case .passwordReset:
                return "Password reset alert"
            case .successfulPasswordReset:
                return "Password reset successful"
            }
        }
    }
}

