//
//  ViewController.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import UIKit

/*
 * Protocol that defines the view input methods.
 */
protocol AchievementsViewInterface: class {
    func showAchievementsData(achievements: [Achievement])
    func showNoContentScreen()
}

class AchievementsTableViewController: UITableViewController, AchievementsViewInterface {
    func showAchievementsData(achievements: [Achievement]) {
        self.achievements = achievements
    }
    
    func showNoContentScreen() {
        print("No achievements available")
    }
    
    var presenter: AchievementsPresenter!
    
    fileprivate lazy var infoBarButton: UIBarButtonItem = {
        let infoButton = UIButton(type: .infoLight)
        infoButton.tintColor = .white
        let button = UIBarButtonItem(customView: infoButton)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0, weight: .light),
                                                                        NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationItem.rightBarButtonItem = infoBarButton
        self.navigationController?.navigationBar.barTintColor = UIColor.purple
        self.title = "Smart Investing"
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.register(AchievementTableViewCell.self, forCellReuseIdentifier: "Cell")
        presenter.updateView()
    }

    var achievements: [Achievement] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? AchievementTableViewCell else { return UITableViewCell() }
        let achievement = achievements[indexPath.row]
        
        cell.selectionStyle = .none
        cell.setup(achievement)
        
        return cell
    }
}
