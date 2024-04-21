//
//  MessageInputView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI


struct MessageInputView: View {
    
    @Binding var messageText: String
    let action: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Enter your message here", text: $messageText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                action(messageText)
                messageText = ""
            }
            label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Green2"))
                    .cornerRadius(50)
            }
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant(""), action: { _ in })
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
