//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Marc Jacques on 4/2/22.
//

import Foundation


final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        
    }
    
    private init () {}
    
    // MARK: - Public
    
    public var watchlist: [String] {
        return []
    }
    
    public func addToWatchlist() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    // MARK: - Private
    
    private var hasOnbarded: Bool {
        return false
    }
    
}
