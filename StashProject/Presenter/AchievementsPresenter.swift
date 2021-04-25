//
//  AchievementsPresenter.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation
/*
 * Protocol that defines the commands sent from the View to the Presenter.
 */
protocol AchievementsModuleInterface: class {
    func updateView()
    func showDetailsForAchievement(achievement: Achievement)
}


/*
 * Protocol that defines the commands sent from the Interactor to the Presenter.
 */
protocol AchievementsInteractorOutput: class {
    func achievementsFetched(achievements: [Achievement])
}


/*
 * The Presenter is also responsible for connecting
 * the other objects inside a VIPER module.
 */
class AchievementsPresenter : AchievementsModuleInterface, AchievementsInteractorOutput
{
    // Reference to the View (weak to avoid retain cycle).
    weak var view: AchievementsViewInterface!

    // Reference to the Interactor's interface.
    var interactor: AchievementsInteractorInput!

    // Reference to the Router
    var router: AchievementsRouter!
    
    var achievements: [Achievement] = [] {
        didSet {
            if achievements.count > 0 {
                view?.showAchievementsData(achievements: achievements)
            } else {
                view?.showNoContentScreen()
            }
        }
    }


    // MARK: AchievementsModuleInterface

    func updateView() {
        self.interactor.fetchAchievements()
    }

    func showDetailsForAchievement(achievement: Achievement) {
        self.router.presentDetailsInterfaceForAchievement(achievement: achievement)
    }

    // MARK: AchievementsInteractorOutput

    func achievementsFetched(achievements: [Achievement]) {
        if achievements.count > 0 {
            self.achievements = achievements
            self.view.showAchievementsData(achievements: achievements)
        } else {
            self.view.showNoContentScreen()
        }
    }
}
