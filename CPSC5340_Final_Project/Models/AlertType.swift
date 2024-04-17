//
//  AlertType.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/16/24.
//

import Foundation

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
