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
    
    func postMovieRate(rate: Int,
                       completion: @escaping(
    _ result: Swift.Result<NetworkResponse, NetworkError>,
    _ statusCode: Int?) -> Void)
}

class HomeWebService: HomeWebServiceProtocol {
    func postMovieRate(rate: Int, completion: @escaping (Result<NetworkResponse, NetworkError>, Int?) -> Void) {
         NetworkManager.shared.fetch(endPoint: PopularMoviesService
            .postMovieReview(value: rate)) { (result: Result<NetworkResponse, NetworkError>, statusCode) in
                   switch result {
                   case .success(let data):
                       //self.movies = Binding(listData.results ?? [])
                       // must send statuscode as property in model
                       //check the status code
                    completion(Result.success(data), nil)
                   case .failure(let error):
                    print("error \(error.errorMessage())")
                       
                       completion(Result.failure(error), statusCode)
                   }
         }
    }
    
    static let shared = HomeWebService()
    
    func getPopularMovies(
        page: Int,
        completion: @escaping (Result<MovieListsResponse<[MovieModel]>, NetworkError>, Int?) -> Void) {
        
        NetworkManager.shared.fetch(
        endPoint: PopularMoviesService.getPopularMovies(
            page: page)) { (result: Result<MovieListsResponse<[MovieModel]>, NetworkError>, statusCode) in
            switch result {
            case .success(let listData):
                //self.movies = Binding(listData.results ?? [])
                // must send statuscode as property in model
                //check the status code
                completion(Result.success(listData), nil)
            case .failure(let error):
                print("error \(error)")
                //error.statusCode = statusCode
                completion(Result.failure(error), statusCode)
            }
        }
    }
    
}
