//
//  NetworkManager.swift
//  Plan-It
//
//  Created by Julia Zeng on 5/3/24.
//

import Alamofire
import Foundation

class NetworkManager {

    /// Shared singleton instance
    static let shared = NetworkManager()

    private init() { }

    /// Endpoint for dev server
    private let devEndpoint: String = "http://127.0.0.1:8000"
    
    let decoder = JSONDecoder()
    

    // MARK: - Requests

    func getUser(id: String, completion: @escaping (User) -> Void) {
        let getEndpoint = devEndpoint + "/users/\(id)/"
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(getEndpoint, method: .get)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                    print("success")
                case .failure(let error):
                    print("Error in NetworkManager.getPosts: \(error.localizedDescription)")
                    completion(User(
                        id: 0,
                        name: "",
                        username: "",
                        available_times: [],
                        events_joined: []
                    ))
                }
            }
    }
}

