//
//  AppDelegate.swift
//  boatsaily
//
//  Created by yasin on 18.07.2024.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Realm Database file location address
        let _ = UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        
        //Realm database login TODO: will remove
        let appID = "data-ovpatrg"
               let app = App(id: appID)

               // Anonim giriş yapılıyor
               app.login(credentials: Credentials.anonymous) { result in
                   switch result {
                   case .failure(let error):
                       print("Giriş yapılamadı: \(error.localizedDescription)")
                   case .success(let user):
                       print("Başarıyla giriş yapıldı: \(user)")
                   }
               }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TabBarViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

