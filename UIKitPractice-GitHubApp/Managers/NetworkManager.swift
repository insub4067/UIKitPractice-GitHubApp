//
//  NetworkManager.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/21.
//

import UIKit

fileprivate enum Keys {
    static let baseURL = "https://api.github.com/users/"
    static let user = "insub4067"
    static let token = "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"
}

class NetworkManager {
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()

    private init() {}

    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {

        let loginString = String(format: "%@:%@", Keys.user, Keys.token)
        let loginData = loginString.data(using: String.Encoding.utf8)

        guard let loginData = loginData else { return }

        let base64LoginString = loginData.base64EncodedString()

        let endpoint = Keys.baseURL + "\(username)/followers?per_page=100&page=\(page)"

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

    func getFollowerInfo(for username: String, completion: @escaping (Result<User, GFError>) -> Void) {

        let loginString = String(format: "%@:%@", Keys.user, Keys.token)
        let loginData = loginString.data(using: String.Encoding.utf8)

        guard let loginData = loginData else { return }

        let base64LoginString = loginData.base64EncodedString()

        let endpoint = Keys.baseURL + "\(username)"

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
                decoder.dateDecodingStrategy = .iso8601
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
