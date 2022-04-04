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
        static let baseUrl = "https://finnhub.io/api/v1/"
    }
    
    private init() {}
    
    // MARK: - Public
    
    // get stock info
    
    // search stocks
    public func search( query: String, completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = url(for: .search, queryParameters: ["q": query]) else { return }
    }
    
    // MARK: - Private functions
    
    private enum Endpoint: String {
        case search
        
    }
    
    private enum APIError: Error {
        case invalidUrl
        case noDataReturned
    }
    
    private func url(for endpoint: Endpoint, queryParameters: [String: String] = [:]) -> URL? {
        var urlString = Constants.baseUrl + endpoint.rawValue
        
        var queryItems = [URLQueryItem]()
        // add parameters
        for (key, value) in queryParameters {
            queryItems.append(.init(name: key, value: value))
        }
        
        //add token
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        
        //add queri items string
        
       urlString += "?" + queryItems.map { "\($0.name)=\($0.value ?? "")"  }.joined(separator: "&")
        
        print("\n\(urlString)\n")
        return URL(string: urlString)
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
