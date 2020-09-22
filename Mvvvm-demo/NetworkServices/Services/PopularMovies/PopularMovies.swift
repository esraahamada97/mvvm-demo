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
    case postMovieReview(value: Int)
}

extension PopularMoviesService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        
        switch self {
        case .getPopularMovies:
            return "/movie/popular"
            
        case .postMovieReview:
            return "/movie/505/rating"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPopularMovies:
            return .get
        case .postMovieReview:
            return .post
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
            
        case .postMovieReview(value: let value):
            return .requestParameters(parameters: [
                "api_key": NetworkManager.shared._networkConfig?.apiKey ?? "",
                "guest_session_id": "38b5ba382170c4cd1a2342efff241e7c",
                "value": value], encoding: URLEncoding.queryString )
        }
    }
    
    var headers: [String: String]? {
        return nil 
        //        switch self {
        //        case .getPopularMovies:
        //            return nil
        //        case .postMovieReview:
        //            return ["Authorization": "Bearer " + (UserManager.getAccessToken() ?? "")]
        //        }
    }
}

//extension PopularMoviesService: AccessTokenAuthorizable {
//
//    var authorizationType: AuthorizationType? {
//        return .bearer
//    }
//}
