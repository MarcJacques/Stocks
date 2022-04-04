//
//  APIManager.swift
//  Stocks
//
//  Created by Marc Jacques on 4/2/22.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    
    private struct Constants {
        static let apiKey = "c95mo1qad3iek697ocmg"
        static let sandboxApiKey = "sandbox_c95mo1qad3iek697ocn0"
        static let baseUrl = "https://finnhub.io/api/v1"
    }
    
    private init() {}
    
    // MARK: - Public
    
    // get stock info
    
    // search stocks
    
    // MARK: - Private functions
    
    private enum Endpoint: String {
        case search
        
    }
    
    private enum APIError: Error {
        case invalidUrl
        case noDataReturned
    }
    
    private func url(for endpoint: Endpoint, queryParamters: [String: String] = [:]) -> URL? {
        
        
        
        return nil
    }
    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            // Invalid url
            completion(.failure(APIError.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
