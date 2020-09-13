//
//  Enviroment.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/6/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

// swiftlint:disable all
enum Environment {
    
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let baseURL: String = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
     
    let baseUrl = "https://\(rootURLstring)"
        return baseUrl
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
