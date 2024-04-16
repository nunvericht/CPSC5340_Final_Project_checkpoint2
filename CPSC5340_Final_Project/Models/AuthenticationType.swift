//
//  AuthenticationType.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/14/24.
//

import Foundation

enum AuthenticationType: String {
    case login
    case signup

    var text: String {
        rawValue.capitalized
    }

    var assetBackgroundName: String {
        self == .login ? "login" : "signup"
    }

    var footerText: String {
        switch self {
            case .login:
                return "Not a member, signup"

            case .signup:
                return "Already a member? login"
        }
    }
}

extension NSError: Identifiable {
    public var id: Int { code }
}

