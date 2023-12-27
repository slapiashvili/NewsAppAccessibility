//
//  NetworkService.swift
//  AccessibleNews
//
//  Created by Salome Lapiashvili on 28.12.23.
//

import SwiftUI

class NetworkService {
    static let shared = NetworkService()

    private init() {} 

    func fetchData(completion: @escaping (Result<NewsApiResponse, Error>) -> Void) {
        guard let url = URL(string: "https://api.thenewsapi.com/v1/news/all?api_token=JCpZQ0J33GznfKBTINFWXUeoGnFcV8kk8d1RvO3G&language=en&limit=3") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(NewsApiResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
}
