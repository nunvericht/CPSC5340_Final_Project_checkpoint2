//
//  MessageTextView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/19/24.
//

import SwiftUI


struct MessageTextView: View {
    
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ?
                                Color("Gray2") : Color("Green2"))
                    .cornerRadius(30)
            }
            .frame(minWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageTextView_Previews: PreviewProvider {
    static var previews:some View {
        MessageTextView(message: Message(id: "1", text: "Welcome to the Pet Shelter chat", received: true, timeStamp: Date()))
    }
}

