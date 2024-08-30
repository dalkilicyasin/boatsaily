//
//  AppDelegate.swift
//  boatsaily
//
//  Created by yasin on 18.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let _ = UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TabBarViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

