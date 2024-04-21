//
//  AuthModel.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import Foundation
import FirebaseAuth


class AuthModel {
    
    func login(email: String, password: String, completion: @escaping (Result<UserModel, AuthModelError>) -> Void) {
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
                self.fetchUserProfile(completion: { userProfile, error in
                    if let error = error {
                        completion(.failure(.unknownError(error.localizedDescription)))
                    } 
                    else if let userProfile = userProfile {
                        completion(.success(userProfile))
                    }
                    else {
                        completion(.failure(.userNotFound))
                    }
                })
            }
        }
    }

    func register(email: String, password: String, name: String, completion: @escaping (Result<Void, AuthModelError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
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
                if let user = Auth.auth().currentUser {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = name
                    changeRequest.commitChanges { error in
                        if let error = error {
                            completion(.failure(.unknownError(error.localizedDescription)))
                        } else {
                            completion(.success(()))
                        }
                    }
                } else {
                    completion(.failure(.unknownError("User not found after successful registration.")))
                }
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
    
    func fetchUserProfile(completion: @escaping (UserModel?, AuthModelError?) -> Void) {
        if let user = Auth.auth().currentUser {
            // placeholder-add ability to customize user profile pictures in future
            let profileURL = "https://cdn2.thedogapi.com/images/quiHq2FiB.jpg"
            let userProfile = UserModel(uid: user.uid, email: user.email, name: user.displayName,  profileURL: profileURL)
            completion(userProfile, nil)
        }
        else {
            completion(nil, .userNotFound)
        }
    }
    
    func fetchUser(withID id: String, completion: @escaping (UserModel?) -> Void) {
        self.fetchUserProfile { userProfile, error in
            DispatchQueue.main.async {
                if let user = userProfile {
                    completion(user)
                }
                else {
                    completion(nil)
                }
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
