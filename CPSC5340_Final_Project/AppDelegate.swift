//
//  AppDelegate.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/17/24.
//

import Foundation
import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
