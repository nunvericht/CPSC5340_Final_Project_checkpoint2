//
//  ContentView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/2/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.blue, .green, .orange, .red],  startPoint: .topLeading, endPoint: .bottomTrailing))
            LoginFormView(authViewModel: authViewModel)
            }
        .ignoresSafeArea()
        .alert(isPresented: $authViewModel.hasError) {
            Alert(
                title: Text("Error"),
                message: Text(authViewModel.error?.errorDescription ?? "An unknown error occurred"),
                    dismissButton: .default(Text("OK"))
            )
        }
    }
}
    
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authViewModel: AuthViewModel())
    }
}
