//
//  ChatMessage.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import Foundation


struct ChatMessage: Identifiable {
    
    let id: String
    let text: String
    let userID: String
    var timeStamp: Date
}
