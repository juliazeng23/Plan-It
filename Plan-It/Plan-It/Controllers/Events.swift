//
//  Events.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation
import UIKit

class Events: UIViewController {
    
    private var collectionView: UICollectionView!
    private let pageTitle = UILabel()
    private let id = "0"
    private var user = User(
        id: 0,
        name: "",
        username: "",
        available_times: [],
        events_joined: []
    )
    
    private var events: [Event] = [
        Event(id: 0, description: "Brunch at Milkstand", users: ["jwz28", "cd494"]),
        Event(id: 4, description: "E-Board Meeting", users: ["jwz28", "eyh29"]),
        Event(id: 2, description: "Hack Challenge Meeting", users: ["jwz28", "cd494", "wbz3"]),
        Event(id: 3, description: "Banquet", users: ["jwz28"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.PI.offWhite
        
        title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTitle()
        setupCollectionView()
    }
    
    @objc func fetchUser() {
        NetworkManager.shared.getUser(id: self.id, completion: {[weak self] user in
            guard let self  = self else { return }
            
            self.user = user
        })
    }
    
    private func setupCollectionView() {
        let padding: CGFloat = 24   // Use this constant when configuring constraints
                
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.PI.offWhite
        
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupTitle() {
        pageTitle.text = "Events"
        pageTitle.font = .systemFont(ofSize: 32, weight: .semibold)
        pageTitle.textColor = UIColor.black
        
        view.addSubview(pageTitle)
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitle.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

// Delegate

extension Events: UICollectionViewDelegate {}

// DataSource

extension Events: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reuse, for: indexPath) as? EventCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(event: events[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            // TODO: Return the inset for the spacing between the two sections
//            let spacing: CGFloat = 24
//            return UIEdgeInsets(top: spacing, left: 0, bottom: 0, right: 0)
//        }
}

// Delegate FlowLayout

extension Events: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 184)
    }
}
