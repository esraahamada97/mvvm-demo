//
//  PopularMovies.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Moya

// swiftlint:disable all
enum MovieDetailsService {
    case getMovieDetails(movieId: Int)
}

extension MovieDetailsService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        
        switch self {
        case .getMovieDetails(let movieId):
            return "/movie/\(movieId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieDetails:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .getMovieDetails:
            return .requestParameters(parameters: [
                "api_key": NetworkManager.shared._networkConfig?.apiKey ?? "",
                "languag": "en-US"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
