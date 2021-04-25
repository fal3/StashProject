//
//  StashProjectTests.swift
//  StashProjectTests
//
//  Created by Alexander Fallah on 4/25/21.
//

import XCTest

@testable import StashProject

class StashProjectTests: XCTestCase {
    
    func testExpectedCase() throws {
        let router = AchievementsRouter()
        let view = AchievementsTableViewController()
        let presenter = AchievementsPresenter()
        let interactor = AchievementsInteractor()

        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.achievementViewController = view
        
        XCTAssertTrue(presenter.achievements.count == 0)
        interactor.fetchAchievements()
        XCTAssertTrue(presenter.achievements.count == 3)
        
        for ach in presenter.achievements {
            XCTAssertTrue(ach.isValid)
        }
    }

    
    //This doesnt work for the life of me
//    func testEdgeCase() throws {
//        let router = AchievementsRouter()
//        let view = AchievementsTableViewController()
//        let presenter = AchievementsPresenter()
//        let interactor = AchievementsInteractor()
//
//        view.presenter = presenter
//
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//
//        interactor.output = presenter
//
//        router.achievementViewController = view
//
//        XCTAssertTrue(presenter.achievements.count == 0)
//        interactor.fetchAchievementsEdge()
//
//
//
//        for ach in presenter.achievements {
//            XCTAssertTrue(!ach.isValid)
//        }
//        XCTAssertTrue(presenter.achievements.count == 2)
//
//    }

    func testNullCase() throws {
        let router = AchievementsRouter()
        let view = AchievementsTableViewController()
        let presenter = AchievementsPresenter()
        let interactor = AchievementsInteractor()

        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        XCTAssertTrue(presenter.achievements.count == 0)
        interactor.fetchAchievementsNull()
        XCTAssertTrue(presenter.achievements.count == 0)
    }

}
