//
//  AchievementsInteractor.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation
/*
 * Protocol that defines the Interactor's use case.
 */
protocol AchievementsInteractorInput: class {
    func fetchAchievements()
}


/*
 * The Interactor responsible for implementing
 * the business logic of the module.
 */
class AchievementsInteractor : AchievementsInteractorInput
{
    // Reference to the Presenter's output interface.
    weak var output: AchievementsInteractorOutput?


    // MARK: AchievementsInteractorInput

    func fetchAchievements() {
        if let file = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let decoder = JSONDecoder()
                
                let decoded = try decoder.decode(Achievements.self, from: data)

                self.output?.achievementsFetched(achievements: decoded.achievements)
            } catch {
                self.output?.achievementsFetched(achievements: [])
            }
        } else {
            self.output?.achievementsFetched(achievements: [])
        }
    }
    
    
    func fetchAchievementsEdge() {
        if let file = Bundle.main.path(forResource: "achievementsEdge", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let decoder = JSONDecoder()
                
                let decoded = try decoder.decode(Achievements.self, from: data)

                self.output?.achievementsFetched(achievements: decoded.achievements)
            } catch {
                self.output?.achievementsFetched(achievements: [])
            }
        } else {
            self.output?.achievementsFetched(achievements: [])
        }
    }
    
    
    func fetchAchievementsNull() {
        if let file = Bundle.main.path(forResource: "achievementsNull", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let decoder = JSONDecoder()
                
                let decoded = try decoder.decode(Achievements.self, from: data)

                self.output?.achievementsFetched(achievements: decoded.achievements)
            } catch {
                self.output?.achievementsFetched(achievements: [])
            }
        } else {
            self.output?.achievementsFetched(achievements: [])
        }
    }
}
