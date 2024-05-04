//
//  User.swift
//  Plan-It
//
//  Created by Julia Zeng on 5/3/24.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let available_times: [String]
    let events_joined: [String]
}
