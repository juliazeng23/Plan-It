//
//  Event.swift
//  PlanIt
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation

struct Event: Codable {
    let id: Int
    let description: String
    let users: [String]
}
