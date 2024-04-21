//
//  ContentView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            if !authViewModel.isLoggedIn {
                SignInView()
            }
            else {
                MainChatView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
