//
//  MessageView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI

struct MessageView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showTime = false
    @State private var senderUsername: String? = nil
    let userId: String
    let message: ChatMessage
    
    var isCurrentUser: Bool {
        message.userID == userId
    }
    
    var body: some View {
        VStack(alignment: isCurrentUser ? .trailing : .leading) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(backgroundColor(forCurrentUser: isCurrentUser))
                    .cornerRadius(10)
            }
            .frame(minWidth: 300, alignment: isCurrentUser ? .trailing : .leading)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text(formattedTimeStamp())
                    .font(.caption2)
                    .foregroundStyle(Color(.gray))
                    .padding(isCurrentUser ? .trailing : .leading, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(isCurrentUser ? .trailing : .leading)
        .padding(.horizontal, 10)
    }
    
    private func backgroundColor(forCurrentUser: Bool) -> Color {
        forCurrentUser ? Color("Green2") : Color("Gray2")
    }
    
    private func formattedTimeStamp() -> String {
        if Calendar.current.isDateInToday(message.timeStamp) {
            return message.timeStamp.formatted(.dateTime.hour().minute())
        }
        else {
            return message.timeStamp.formatted(.dateTime.month().day().hour().minute())
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMessage = ChatMessage(id: "1", text: "How can I help?", userID: "user123", timeStamp: Date())
        let sampleUserId = "user123"
        MessageView(userId: sampleUserId, message: sampleMessage)
    }
}
