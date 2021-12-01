//
//  AppDelegate.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UITabBar.appearance().tintColor = .red
        app.router.start()
        return true
    }



}

