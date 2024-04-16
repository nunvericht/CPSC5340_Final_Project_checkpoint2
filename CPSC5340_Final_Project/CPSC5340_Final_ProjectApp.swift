//
//  CPSC5340_Final_ProjectApp.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/2/24.
//

import SwiftUI
import Firebase


@main
struct CPSC5340_Final_ProjectApp: App {
        
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
