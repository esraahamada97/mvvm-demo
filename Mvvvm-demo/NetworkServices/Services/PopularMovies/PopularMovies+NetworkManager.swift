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
    
    
        
//        MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()]).request(MultiTarget(endPoint)) { (response) in
//            switch response {
//            case .success(let response):
//                do {
//                    let jsonResponse = try response.mapJSON()
//                    compltion(Result.success(jsonResponse))
//                } catch {
//                    print(error.localizedDescription)
//                }
//
//            case .failure(let error):
//                compltion(.failure(NetworkError(error: error)))
//            }
//        }
    
    func getPopularMovies(page: Int,
                          completion: @escaping(
        _ result: Swift.Result<MovieListsResponse<[MovieModel]>,
        NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(PopularMoviesService.getPopularMovies(page: page))) { result in
            
                self.parseResponse(moyaResult: result, completion: completion)
        }
    }

}
