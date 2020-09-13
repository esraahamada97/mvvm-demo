//
//  MovieDetailsService + NetworkManager.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Moya
extension NetworkManager {
    
    func getMovieDetails(movieId: Int,
                         completion: @escaping(
        _ result: Swift.Result< MovieDetails,
        NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(MovieDetailsService.getMovieDetails(movieId: movieId))) { result in
                self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
