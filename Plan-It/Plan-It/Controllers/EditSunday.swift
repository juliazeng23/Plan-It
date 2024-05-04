//
//  EditSunday.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation
import UIKit

class EditSunday: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private var times: [String] = ["12:00am", "12:15am", "12:30am", "12:45am", "1:00am", "1:15am", "1:30am", "1:45am", "2:00am", "2:15am", "2:30am", "2:45am", "3:00am", "3:15am", "3:30am", "3:45am", "4:00am"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.PI.offWhite
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let padding: CGFloat = 24   // Use this constant when configuring constraints
                
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.PI.offWhite
        
        collectionView.register(TimeCollectionViewCell.self, forCellWithReuseIdentifier: TimeCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
}

// Delegate

extension EditSunday: UICollectionViewDelegate {}

// DataSource

extension EditSunday: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuse, for: indexPath) as? TimeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(time: times[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return times.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// Delegate FlowLayout

extension EditSunday: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 36)
    }
}
