//
//  ContentView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var authViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            if !authViewModel.isLoggedIn {
                SignInView(authViewModel: authViewModel)
            }
            else {
                LoggedInView(authViewModel: authViewModel)
            }
        }
    }
}


#Preview {
    ContentView()
}
