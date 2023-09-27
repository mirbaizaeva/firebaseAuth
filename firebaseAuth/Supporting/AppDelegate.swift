//
//  AppDelegate.swift
//  firebaseAuth
//
//  Created by Nurjamal Mirbaizaeva on 18/9/23.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        print("Debug print:", Validator.isPasswordValid(for: "password"))
        print("Debug print:", Validator.isPasswordValid(for: "$password"))
        print("Debug print:", Validator.isPasswordValid(for: "$1password"))
        print("Debug print:", Validator.isPasswordValid(for: "$1password"))
        print("Debug print:", Validator.isPasswordValid(for: "password"))
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

