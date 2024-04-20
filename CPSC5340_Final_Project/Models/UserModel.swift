//
//  UserModel.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/18/24.
//

import Foundation


struct UserModel: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let isCurrentUser: Bool
    
}
