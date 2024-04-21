//
//  NewMessage.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI

struct NewMessage: View {
    @State private var search = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $search)
                    .frame(height: 44)
                    .padding(.leading)
                Text("Contacts")
                    .foregroundStyle(Color(.gray))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ForEach(0...5, id: \.self) { user in
                    VStack {
                        HStack {
                            Image(systemName: "dog.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                            Text("Dog Rescue User")
                            Spacer()
                            
                        }
                        .padding()
                        Divider()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessage()
}
