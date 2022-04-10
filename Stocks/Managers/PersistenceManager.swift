//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Marc Jacques on 4/2/22.
//

import Foundation

// ["AAPL","MSFT","SNAP"]
// [APPL: APPLE Inc.]
final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        static let onboardedKey = "hasOnboarded"
        static let watchListKey = "watchlist"
    }
    
    private init () {}
    
    // MARK: - Public
    
    public var watchlist: [String] {
        if !hasOnbarded {
            userDefaults.setValue(true, forKey: Constants.onboardedKey)
            setupDefaults()
        }
        return userDefaults.stringArray(forKey: Constants.watchListKey) ?? [ ]
    }
    
    public func addToWatchlist() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    // MARK: - Private
    
    private var hasOnbarded: Bool {
        return userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    private func setupDefaults() {
        let dictionary: [String: String] = [
            "FB": "Meta Platforms Inc",
            "AAPL": "Apple Inc",
            "AMZN": "Amazon.com Inc.",
            "NFLX": "Netflix Inc",
            "GOOG": "Alphabet",
            "UBER": "Uber Technologies Inc",
            "LYFT": "LYFT Inc",
            "TSLA": "Tesla Inc",
            "ABNB": "Airbnb Inc",
            "DBX": "Dropbox Inc",
            "SNAP": "Snap Inc"
        ]
        
        let symbols = dictionary.keys.map { $0 }
        userDefaults.set(symbols, forKey: Constants.watchListKey)
        
        for (symbol, name) in dictionary {
            userDefaults.set(name, forKey: symbol)
        }
    }
    
}
