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
enum PopularMoviesService {
    case getPopularMovies(page: Int)
}

extension PopularMoviesService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        
        switch self {
        case .getPopularMovies:
            return "/movie/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPopularMovies:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .getPopularMovies(let page):
            return .requestParameters(parameters: [
                "api_key": NetworkManager.shared._networkConfig?.apiKey ?? "",
                "languag": "en-US",
                "page": page], encoding: URLEncoding.default)
            //            return .requestParameters(parameters: [
            //                "api_key": NetworkManager.shared._networkConfig?.apiKey ?? "",
            //                "languag": "en-US",
            //                "page": page], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

//extension PopularMoviesService: AccessTokenAuthorizable {
//
//    var authorizationType: AuthorizationType? {
//        return .bearer
//    }
//}
