//
//  RegistrationForm.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/19/24.
//

import SwiftUI


struct RegistrationForm: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
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
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding()
                        VStack (spacing: 15) {
                            TextField("Enter your email", text: $authViewModel.email)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .font(.subheadline)
                                .foregroundStyle(Color(.blue))
                                .padding(12)
                                .cornerRadius(10)
                                .padding(.horizontal, 24)
                                .background(Color(.systemGray6))
                            TextField("Enter your name", text: $authViewModel.name)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .font(.subheadline)
                                .foregroundStyle(Color(.blue))
                                .padding(12)
                                .cornerRadius(10)
                                .padding(.horizontal, 24)
                                .background(Color(.systemGray6))
                            SecureField("Enter your password", text: $authViewModel.password)
                                .foregroundStyle(Color(.blue))
                                .textFieldStyle(.plain)
                                .autocapitalization(.none)
                                .font(.subheadline)
                                .foregroundStyle(Color(.blue))
                                .padding(12)
                                .cornerRadius(10)
                                .padding(.horizontal, 24)
                                .background(Color(.systemGray6))
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        Button {
                            authViewModel.register()
                        }
                    label: {
                        Text("Sign Up")
                            .bold()
                            .frame(width: 360, height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.pink, .blue],  startPoint: .topLeading, endPoint: .bottomTrailing)))
                            .foregroundStyle(Color(.white))
                    }
                    .padding(.top, 15)
                        Spacer()
                        Divider()
                        Button {
                            dismiss()
                        }
                    label: {
                        HStack(spacing: 3) {
                            Text("Already have an account?")
                            Text ("Sign-in")
                                .bold()
                        }
                        .foregroundStyle(Color(.blue))
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


struct RegistrationForm_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationForm()
            .environmentObject(AuthViewModel())
    }
}

