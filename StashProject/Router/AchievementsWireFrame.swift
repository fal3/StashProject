//
//  AchievementsWireframe.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation
import UIKit
/*
 * Protocol that defines the possible routes from the Achievements module.
 */
protocol AchievementsWireframeInput {
    func presentDetailsInterfaceForAchievement(achievement: Achievement)
}

/*
 * The Router responsible for navigation between modules.
 */
class AchievementsRouter : NSObject, AchievementsWireframeInput
{
    // Reference to the ViewController (weak to avoid retain cycle).
    weak var achievementViewController: AchievementsTableViewController?

    static func assembleModule() -> UIViewController {
        let view = AchievementsTableViewController()
        let presenter = AchievementsPresenter()
        let interactor = AchievementsInteractor()
        let router = AchievementsRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.achievementViewController = view
        
        return navigation
    }
    // MARK: AchievementsWireframeInput

    func presentDetailsInterfaceForAchievement(achievement: Achievement) {

    }


    // MARK: Private

    private func sendArticleToDetailsPresenter(detailsPresenter: AchievementsPresenter, achievement: Achievement) {

    }
}
