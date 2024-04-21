//
//  AuthModelError.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import Foundation


enum AuthModelError: Error, Equatable {
    
    case wrongPassword
    case invalidEmail
    case emailAlreadyInUse
    case weakPassword
    case userNotFound
    case unknownError(String)
    
    var errorDescription: String? {
        switch self {
        case .wrongPassword:
            return "Incorrect password. Please try again."
        case .invalidEmail:
            return "Invalid email address."
        case .emailAlreadyInUse:
            return "Email address is already in use."
        case .weakPassword:
            return "Password is weak. Please choose a stronger password."
        case .userNotFound:
            return "User not found."
        case .unknownError(let message):
            return message
        }
    }
}
