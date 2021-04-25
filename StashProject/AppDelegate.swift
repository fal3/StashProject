//
//  AppDelegate.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import UIKit

@main
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentAchievementsScreen(in: window!)

        return true
    }
}
