//
//  EventCollectionViewCell.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation
import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    private let desc = UILabel()
    private let users = UILabel()
    private let viewEventButton = UIButton()
    
    static let reuse = "EventCollectionViewCellReuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 16
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        setupDesc()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(event: Event) {
        desc.text = event.description
        
        var usersString = ""
        for u in event.users {
            usersString = usersString + u
        }
        users.text = usersString
    }
    
    func setupDesc() {
        desc.font = .systemFont(ofSize: 16, weight: .semibold)
        
        contentView.addSubview(desc)
        desc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desc.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            desc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            desc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            desc.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
