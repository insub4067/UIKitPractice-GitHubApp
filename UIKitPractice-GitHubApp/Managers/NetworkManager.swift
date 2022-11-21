//
//  NetworkManager.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/21.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"

    private init() {}

    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {

        let username = "insub4067"
        let token = "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"
        let loginString = String(format: "%@:%@", username, token)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUsername))
            return
        }

        var request = URLRequest(url: url)
        request.addValue(base64LoginString, forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
