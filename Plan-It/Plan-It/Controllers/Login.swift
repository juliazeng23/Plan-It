//
//  Login.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation
import UIKit

class Login: UIViewController {
    private let nameField = UITextField()
    private let usernameField  = UITextField()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        title = "Login"
        
        setupName()
        setupUsername()
        setupLoginButton()
    }
    
    private func setupName() {
        nameField.placeholder = "Name"
        nameField.font = .systemFont(ofSize: 16)
        nameField.textColor = UIColor.black
        nameField.layer.borderColor = UIColor.PI.silver.cgColor
        nameField.layer.borderWidth = 1
        nameField.layer.cornerRadius = 8
        
        view.addSubview(nameField)
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nameField.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setupUsername() {
        usernameField.placeholder = "Username"
        usernameField.font = .systemFont(ofSize: 16)
        usernameField.textColor = UIColor.black
        usernameField.layer.borderColor = UIColor.PI.silver.cgColor
        usernameField.layer.borderWidth = 1
        usernameField.layer.cornerRadius = 8
        
        view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 12),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            usernameField.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.PI.silver
        loginButton.layer.cornerRadius = 16
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            loginButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        loginButton.addTarget(self, action: #selector(pushTabView), for: .touchUpInside)
    }
    
    @objc private func pushTabView() {
        let tabView = TabViewController()
        navigationController?.pushViewController(tabView, animated: true)
    }
}

