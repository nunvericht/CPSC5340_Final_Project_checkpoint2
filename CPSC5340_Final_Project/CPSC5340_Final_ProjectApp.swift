//
//  CPSC5340_Final_ProjectApp.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/2/24.
//  Dogicon by https://icons8.com" Icons8

import SwiftUI


@main
struct CPSC5340_Final_ProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
