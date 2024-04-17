//
//  LoggedInView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/14/24.
//

import SwiftUI


struct LoggedInView: View {
    
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Welcome, User!")
            Button("Logout") {
                authViewModel.logout()
            }
        }
        .padding()
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        LoggedInView(authViewModel: authViewModel)
    }
}
