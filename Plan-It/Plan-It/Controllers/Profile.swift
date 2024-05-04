//
//  Profile.swift
//  PlanIt
//
//  Created by Julia Zeng on 4/28/24.
//

import Foundation
import UIKit

class Profile: UIViewController {
    private let name = UILabel()
    private let username  = UILabel()
    private let editAvailabilityButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        title = "Profile"
        
        setupName()
        setupUsername()
        setupEditAvailabilityButton()
    }
    
    private func setupName() {
        name.text = "Ezra Cornell"
        name.font = .systemFont(ofSize: 32, weight: .semibold)
        name.textColor = UIColor.black
        
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            name.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setupUsername() {
        username.text = "ec123"
        username.font = .systemFont(ofSize: 16)
        username.textColor = UIColor.gray
        
        view.addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            username.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    private func setupEditAvailabilityButton() {
        editAvailabilityButton.setTitle("Edit Availability", for: .normal)
        editAvailabilityButton.setTitleColor(UIColor.white, for: .normal)
        editAvailabilityButton.backgroundColor = UIColor.PI.silver
        editAvailabilityButton.layer.cornerRadius = 16
        
        view.addSubview(editAvailabilityButton)
        editAvailabilityButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editAvailabilityButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            editAvailabilityButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            editAvailabilityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            editAvailabilityButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        editAvailabilityButton.addTarget(self, action: #selector(pushSelectDays), for: .touchUpInside)
    }
    
    @objc private func pushSelectDays() {
        let selectDays = SelectDays()
        navigationController?.pushViewController(selectDays, animated: true)
    }
}
