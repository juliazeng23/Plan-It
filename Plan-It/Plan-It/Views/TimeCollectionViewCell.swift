//
//  EventCollectionViewCell.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation
import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    private let timeButton = UIButton()
    
    static let reuse = "TimeCollectionViewCellReuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 16
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(time: String) {
        timeButton.setTitle(time, for: .normal)
        timeButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func setupButton() {
        contentView.addSubview(timeButton)
        
        timeButton.setTitleColor(UIColor.blue, for: .selected)
        timeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
