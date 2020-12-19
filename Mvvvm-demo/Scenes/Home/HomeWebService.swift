//
//  HomeWebService.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/15/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeWebServiceProtocol: class {
    
    func getPopularMovies(page: Int) -> Observable<MovieListsResponse<[MovieModel]>>
}

class HomeWebService: HomeWebServiceProtocol {
    
    static let shared = HomeWebService()
    
    func getPopularMovies(page: Int) -> Observable<MovieListsResponse<[MovieModel]>> {
        return
            NetworkManager.shared.fetch(endPoint: PopularMoviesService.getPopularMovies(page: page))
    }
        
}
