//
//  AuthModel.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import Foundation
import FirebaseAuth


class AuthModel {
    func login(email: String, password: String, completion: @escaping (Result<Void, AuthModelError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                switch error.code {
                    case AuthErrorCode.wrongPassword.rawValue:
                        completion(.failure(.wrongPassword))
                    case AuthErrorCode.invalidEmail.rawValue:
                        completion(.failure(.invalidEmail))
                    default:
                        completion(.failure(.unknownError(error.localizedDescription)))
                }
            } 
            else {
                completion(.success(()))
            }
        }
    }

    func register(email: String, password: String, completion: @escaping (Result<Void, AuthModelError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                switch error.code {
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        completion(.failure(.emailAlreadyInUse))
                    case AuthErrorCode.weakPassword.rawValue:
                        completion(.failure(.weakPassword))
                    default:
                        completion(.failure(.unknownError(error.localizedDescription)))
                }
            }
            else {
                completion(.success(()))
            }
        }
    }
    
    func resetPassword(email: String, completion: @escaping (Result<Void, AuthModelError>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error as NSError? {
                switch error.code {
                    case AuthErrorCode.userNotFound.rawValue:
                        completion(.failure(.invalidEmail))
                    default:
                        completion(.failure(.unknownError(error.localizedDescription)))
                }
            } 
            else {
                completion(.success(()))
            }
        }
    }

    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } 
        catch {
            completion(.failure(error))
        }
    }
}
