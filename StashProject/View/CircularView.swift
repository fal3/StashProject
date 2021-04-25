//
//  CircularView.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import UIKit

@objcMembers public class CircularView: UIView {
    ////////////////////////////////////////////////////////////////
    //MARK:-
    //MARK: Variables
    //MARK:-
    ////////////////////////////////////////////////////////////////
    private var size: CGSize { CGSize(width: 124, height: 124) }
    
    private var cornerRadius: CGFloat { min(size.height, size.width) / 2.0 }
    
    fileprivate lazy var level: UILabel = {
        let text = UILabel(frame: CGRect.zero)
        text.numberOfLines = 0
        text.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.lineBreakMode = .byTruncatingTail
        text.text = "Level"
        return text
    }()
    
    fileprivate lazy var levelNumber: UILabel = {
        let textView = UILabel(frame: .zero)
        textView.lineBreakMode = .byTruncatingTail
        textView.font = UIFont.systemFont(ofSize: 64.0, weight: .heavy)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.numberOfLines = 0
        return textView
    }()
    
    private var overallConstraints: [NSLayoutConstraint] {
        return [
            level.centerXAnchor.constraint(equalTo: centerXAnchor),
            level.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            levelNumber.topAnchor.constraint(equalTo: level.topAnchor, constant: 16.0),
            levelNumber.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
    }
    
    ////////////////////////////////////////////////////////////////
    //MARK:-
    //MARK: Initializer
    //MARK:-
    ////////////////////////////////////////////////////////////////

    
    init() {
        super.init(frame: .zero)
        self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        self.layer.cornerRadius = cornerRadius
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ////////////////////////////////////////////////////////////////
    //MARK:-
    //MARK: Helpers
    //MARK:-
    ////////////////////////////////////////////////////////////////

    public func update(number: String) {
        self.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:0.94)
        addSubview(level)
        addSubview(levelNumber)
        levelNumber.text = number
        NSLayoutConstraint.activate(overallConstraints)
    }
}
