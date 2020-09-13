//
//  PopularMovies+NetworkManager.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getPopularMovies(page: Int,
                          completion: @escaping(_ result: Swift.Result<NetworkResponse<[MovieModel]>, NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(PopularMoviesService.getPopularMovies(page: page))) { result in
                self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
