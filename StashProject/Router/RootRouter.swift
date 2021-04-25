//
//  RootRouter.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation

import UIKit

class RootRouter: RootWireframe {
    
    func presentAchievementsScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = AchievementsRouter.assembleModule()
    }
}
