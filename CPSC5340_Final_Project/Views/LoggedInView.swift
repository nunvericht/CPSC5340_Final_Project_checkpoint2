//
//  LoggedInView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/14/24.
//

import SwiftUI


struct LoggedInView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome, \(authViewModel.email)")
                .foregroundColor(.white)
                .padding()
                Button("Logout") {
                    authViewModel.logout()
                }
                .foregroundColor(.white)
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
