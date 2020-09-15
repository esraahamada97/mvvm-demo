//
//  HomeWebService.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/15/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol HomeWebServiceProtocol: class {
    
    func getPopularMovies(page: Int,
                          completion: @escaping(
        _ result: Swift.Result<MovieListsResponse<[MovieModel]>,
        NetworkError>,
        _ statusCode: Int?) -> Void)
}

class HomeWebService: HomeWebServiceProtocol {
    
    static let shared = HomeWebService()
    
    func getPopularMovies(
        page: Int,
        completion: @escaping (Result<MovieListsResponse<[MovieModel]>, NetworkError>, Int?) -> Void) {
        
        NetworkManager.shared.fetch(
        endPoint: PopularMoviesService.getPopularMovies(
            page: page)) { (result: Result<MovieListsResponse<[MovieModel]>, NetworkError>, _) in
            switch result {
            case .success(let listData):
                //self.movies = Binding(listData.results ?? [])
                completion(Result.success(listData), nil)
            case .failure(let error):
                print("error \(error)")
                completion(Result.failure(error), nil)
            }
        }
    }
    
}
