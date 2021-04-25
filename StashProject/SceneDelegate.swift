//
//  SceneDelegate.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

        var window: UIWindow?
        func scene(_ scene: UIScene,
                   willConnectTo session: UISceneSession,
                   options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
            RootRouter().presentAchievementsScreen(in: window!)
        }
    
}

