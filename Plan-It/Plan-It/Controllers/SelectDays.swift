//
//  SelectDays.swift
//  PlanIt
//
//  Created by Julia Zeng on 4/28/24.
//

import Foundation
import UIKit

class SelectDays: UIViewController {
    private let Sunday = UIButton()
    private let Monday = UIButton()
    private let Tuesday = UIButton()
    private let Wednesday = UIButton()
    private let Thursday = UIButton()
    private let Friday = UIButton()
    private let Saturday = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        title = "Days of the Week"
        
        setupSunday()
        setupOtherDays(button: Monday, text: "Monday", previousButton: Sunday)
        setupOtherDays(button: Tuesday, text: "Tuesday", previousButton: Monday)
        setupOtherDays(button: Wednesday, text: "Wednesday", previousButton: Tuesday)
        setupOtherDays(button: Thursday, text: "Thursday", previousButton: Wednesday)
        setupOtherDays(button: Friday, text: "Friday", previousButton: Thursday)
        setupOtherDays(button: Saturday, text: "Saturday", previousButton: Friday)

    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupSunday() {
        Sunday.setTitle("Sunday", for: .normal)
        Sunday.setTitleColor(UIColor.white, for: .normal)
        Sunday.backgroundColor = UIColor.lightGray
        Sunday.layer.cornerRadius = 8
        
        view.addSubview(Sunday)
        Sunday.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            Monday.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            Sunday.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            Sunday.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            Sunday.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            Sunday.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        Sunday.addTarget(self, action: #selector(pushEditSunday), for: .touchUpInside)
    }
    
    private func setupOtherDays(button: UIButton, text: String, previousButton: UIButton) {
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 8
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            button.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func pushEditSunday() {
        let editSunday = EditSunday()
        navigationController?.pushViewController(editSunday, animated: true)
    }
}
