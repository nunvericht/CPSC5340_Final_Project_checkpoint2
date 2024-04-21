//
//  Inbox.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI

struct Inbox: View {
    @State private var showNewMessage = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Online()
                List {
                    ForEach(0 ... 10, id: \.self) { message in
                        InboxItem()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .fullScreenCover(isPresented: $showNewMessage, content: {
                NewMessage()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "person.cicle.fill")
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessage.toggle()
                    }
                    label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.blue, Color(.systemGray4))
                    }
                }
            }
        }
    }
}

#Preview {
    Inbox()
}
