//
//  LoginForm.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import SwiftUI


struct LoginForm: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        GeometryReader { 
            geometry in
            ScrollView {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                VStack {
                    Image("Apollo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(150)
                        .frame(width: 150, height: 150)
                        .padding()
                    Text("Pet Adoption Chat")
                        .foregroundColor(.blue)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .padding()
                    VStack (spacing: 15) {
                        TextField("Enter your email", text: $authViewModel.email)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(12)
                            .cornerRadius(10)
                            .padding(.horizontal, 24)
                            .background(Color(.systemGray6))
                        SecureField("Enter your password", text: $authViewModel.password)
                            .foregroundColor(.blue)
                            .textFieldStyle(.plain)
                            .autocapitalization(.none)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(10)
                            .padding(.horizontal, 24)
                            .background(Color(.systemGray6))
                    }
                    Button {
                        authViewModel.resetButton()
                    }
                label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                Button {
                    authViewModel.login()
                }
                label: {
                    Text("Login")
                        .bold()
                        .frame(width: 360, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .blue],  startPoint: .topLeading, endPoint: .bottomTrailing)))
                        .foregroundColor(.white)
                }
                .padding(.top, 15)
                    Spacer()
                    Divider()
                    NavigationLink {
                        RegistrationForm()
                    }
                label: {
                    HStack(spacing: 3) {
                        Text("Do not have an account?")
                        Text ("Sign-Up")
                            .bold()
                    }
                    .foregroundColor(.blue)
                }
                .padding(.vertical)
                }
                .frame(width: 350)
                .background(Color.clear)
            }
            .frame(minHeight: geometry.size.height)
        }
    }
    .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}



struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
            .environmentObject(AuthViewModel())
    }
}

