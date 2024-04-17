//
//  LoginFormView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import SwiftUI


struct LoginFormView: View {
    
    @ObservedObject var authViewModel: AuthViewModel

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .foregroundColor(.black)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .padding()
            TextField("Email", text: $authViewModel.email)
                .foregroundColor(.white)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(.blue)
            SecureField("Password", text: $authViewModel.password)
                .foregroundColor(.white)
                .textFieldStyle(.plain)
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Button {
                authViewModel.login()
            }
            label: {
            Text("Login")
            .bold()
            .frame(width:200, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.linearGradient(colors: [.pink, .blue],  startPoint: .topLeading, endPoint: .bottomTrailing)))
            .foregroundColor(.white)
            }
            Button {
                authViewModel.register()
            }
            label: {
                Text("Do not have an account? Sign-Up")
                .bold()
                .foregroundColor(.black)
                .padding()
            }
            Button("Reset Password") {
                authViewModel.resetButton()
            }
            .padding()
        }
        .frame(width: 350)
        }
    }


struct LoginFormView_Previews: PreviewProvider {
    @State static var activeAlert: AuthViewModel.AlertType? = nil
    
    static var previews: some View {
        LoginFormView(authViewModel: AuthViewModel()) 
            .previewLayout(.sizeThatFits)
    }
}

