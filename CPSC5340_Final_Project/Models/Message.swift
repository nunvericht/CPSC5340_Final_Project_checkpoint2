//
//  Message.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import Foundation

struct Message : Codable, Identifiable {
    var id: String
    var text: String
    var received: Bool
    var timeStamp: Date
}
