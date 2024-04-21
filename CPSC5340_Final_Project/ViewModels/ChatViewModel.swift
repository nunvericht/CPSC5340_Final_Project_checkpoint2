//
//  ChatViewModel.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


class ChatViewModel: ObservableObject {
    
    @Published var messages = [ChatMessage] ()
    var userId: String {
        Auth.auth().currentUser?.uid ?? ""
    }
    
    init() {
        loadMessages()
        if UserDefaults.standard.string(forKey: "userId") == nil {
            UserDefaults.standard.set(userId, forKey: "userId")
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard !messageText.isEmpty else { return }
        let dbReference = Database.database().reference()
        let messageReference = dbReference.child("messages").childByAutoId()
        
        // date/TimeStamp
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        let timestamp = formatter.string(from: now)
        let messageData = ["text": messageText, "userId": userId, "timestamp": timestamp]
        messageReference.setValue(messageData)
    }
    
    func loadMessages() {
        let dbReference = Database.database().reference()
        dbReference.child("messages").observe(.childAdded, with: { [weak self] snapshot in
            if let data = snapshot.value as? [String: Any],
               let text = data["text"] as? String,
               let userId = data["userId"] as? String,
               let timestampString = data["timestamp"] as? String {
                
                // Datetime documentation:  https://developer.apple.com/documentation/foundation/dateformatter
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM d, yyyy 'at' h:mm:ssa"
                formatter.locale = Locale(identifier: "en_US_POSIX")
                
                let cleanedTimestampString = timestampString.replacingOccurrences(of: "\u{202F}", with: "")
                
                if let timestamp = formatter.date(from: cleanedTimestampString) {
                    let id = snapshot.key
                    let newMessage = ChatMessage(id: id, text: text, userID: userId, timeStamp: timestamp)
                    DispatchQueue.main.async {
                        self?.messages.append(newMessage)
                    }
                } 
                else {
                    print("Error parsing date: \(timestampString)")
                }
            }
        }, withCancel: { error in
            print("Error loading messages: \(error.localizedDescription)")
        })
    }


}
