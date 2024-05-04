//
//  TabViewController.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        
        selectedIndex = 0
    }
    
    private func setupTabs() {
        let eventsVC = Events()
        let profileVC = Profile()
        
        eventsVC.tabBarItem = UITabBarItem(title: "Events", image: UIImage(systemName: "list.bullet.clipboard"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        self.setViewControllers([eventsVC, profileVC], animated: true)
    }
}
