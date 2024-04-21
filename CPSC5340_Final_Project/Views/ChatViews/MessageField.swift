//
//  MessageField.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/19/24.
//

import SwiftUI

struct MessageField: View {
    
    @Binding var message: String
    let action: (String) -> Void
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
            
            Button {
                print("Message sent")
                message = ""
                
            }
            label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Green2"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Tan"))
        .cornerRadius(50)
        .padding()
    }
}

/*#Preview {
    MessageField(message: <#Binding<String>#>, action: <#(String) -> Void#>)
}*/

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View  {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
