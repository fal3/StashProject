//
//  ProgressView.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/25/21.
//

import UIKit

class ProgressView: UIView {
    // MARK: Variables
    fileprivate lazy var progress: UIProgressView = {
        let progressView = UIProgressView()
        progressView.layer.cornerRadius = 5
        progressView.layer.sublayers?[1].cornerRadius = 5
        progressView.layer.masksToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .white
        progressView.progressTintColor = .green
        return progressView
    }()
    
    fileprivate lazy var points: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    fileprivate lazy var pointsTotal: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    ///Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(progress)
        progress.topAnchor.constraint(equalTo: topAnchor).isActive = true
        progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        addSubview(points)
        points.topAnchor.constraint(equalTo: topAnchor,constant: 20.0).isActive = true
        points.leadingAnchor.constraint(equalTo: progress.leadingAnchor).isActive = true
        
        
        addSubview(pointsTotal)
        pointsTotal.topAnchor.constraint(equalTo: topAnchor,constant: 20.0).isActive = true
        pointsTotal.trailingAnchor.constraint(equalTo: progress.trailingAnchor,constant: -4.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Helpers
    
    func update(progressNum: Int, totalNum: Int) {
        points.text = "\(progressNum)pts"
        pointsTotal.text = "\(totalNum)pts"
        progress.progress = Float(progressNum)/Float(totalNum)
    }

}
