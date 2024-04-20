//
//  LoggedInView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/14/24.
//

import SwiftUI


struct LoggedInView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var messageArray = ["Welcome to the Pet Rescue. How can I help you?", "I am looking to adopt a dog", "Thank you for your inquiry, can you provide more information on what type of dog you are looking for?", "I would like one that is good with kids"]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    TitleView()
                        .background(Color("Tan"))
                    ScrollView {
                        Text("Welcome, \(authViewModel.name)")
                        .foregroundColor(.white)
                        .padding()
                        ForEach(messageArray, id: \.self) { text in
                            MessageTextView(message: Message(id: "123", text: text, received: true, timeStamp: Date()))
                        }
                    }
                }
                MessageField()

                Button("Logout") {
                    authViewModel.logout()
                }
                .foregroundColor(.blue)
            }
        }
        
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
            .environmentObject(AuthViewModel())
    }
}
