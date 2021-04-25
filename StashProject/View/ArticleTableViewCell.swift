//
//  AchievementTableViewCell.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//


import UIKit

class AchievementTableViewCell: UITableViewCell {
    // MARK: Variables
    fileprivate lazy var circularView: CircularView = {
       let circularView = CircularView()
        circularView.translatesAutoresizingMaskIntoConstraints = false
        return circularView
    }()
    
    fileprivate lazy var imageHolder: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    fileprivate lazy var progressView: ProgressView = {
        let progressView = ProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    // MARK: Init Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConstraintsToView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helper Methods
    func setup(_ achievement: Achievement) {
        
        circularView.update(number: achievement.level ?? "1")
        progressView.update(progressNum: achievement.progress, totalNum: achievement.total)
        self.achievement = achievement
        downloadImage(achievement: achievement)
 
    }
    
    private var achievement: Achievement?
     
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let achievement = achievement else { return }
        
        if achievement.accessible {
            let shadowLayer = CAShapeLayer()
          
            shadowLayer.path = UIBezierPath(roundedRect: imageHolder.frame, cornerRadius: 8.0).cgPath
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 3

            layer.insertSublayer(shadowLayer, at: 0)
        } else {
            let shadowLayer = CAShapeLayer()
          
            shadowLayer.path = UIBezierPath(roundedRect: imageHolder.frame, cornerRadius: 8.0).cgPath
            shadowLayer.fillColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:0.3).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowRadius = 3

            layer.addSublayer(shadowLayer)
        }
    }
    
    
    /// Helper Methods

    
      fileprivate func downloadImage(achievement: Achievement) {
        DispatchQueue.global(qos: .utility).async {
          if let urlLink = achievement.bgImageUrl,
             let url = URL(string: urlLink),
             let data = try? Data(contentsOf: url),
             let image = UIImage(data: data) {
              DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.imageHolder.image =  image
                
                self.layoutSubviews()
              }
          }
        }
      }
    
    
    fileprivate func addConstraintsToView() {
        //content view
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        ///background image
        contentView.addSubview(imageHolder)
        imageHolder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        imageHolder.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: imageHolder.trailingAnchor, constant: 16.0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: imageHolder.bottomAnchor, constant: 8.0).isActive = true
        
        ///Circle View
        imageHolder.addSubview(circularView)
        circularView.topAnchor.constraint(equalTo: imageHolder.topAnchor, constant: 20).isActive = true
        circularView.centerXAnchor.constraint(equalTo: imageHolder.centerXAnchor).isActive = true
        
        ///Progress View
        contentView.addSubview(progressView)
        progressView.topAnchor.constraint(equalTo: circularView.bottomAnchor, constant: 16.0).isActive = true
        progressView.leadingAnchor.constraint(equalTo: imageHolder.leadingAnchor).isActive = true
        progressView.trailingAnchor.constraint(equalTo: imageHolder.trailingAnchor).isActive = true

    }

}
