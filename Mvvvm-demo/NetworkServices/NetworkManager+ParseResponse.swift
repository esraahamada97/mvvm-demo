//
//  NetworkManager+ParseResponse.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func parseResponse<T: Codable>(moyaResult: MoyaCompletion,
                                   completion: @escaping(NetworkCompletion<T>)) {
        
        switch moyaResult {
        case .success(let response):
            
            if (200...299 ~= response.statusCode) {
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
                    
                    completion(.success(result), response.statusCode)
                } catch {
                    completion(.failure(NetworkError(error: error)), response.statusCode)
                }
            } else {
                // 300-399 ,400-499
                do {
                    let error = try JSONDecoder().decode(NetworkError.self, from: response.data)
                    var businessError = error
                    businessError.type = .business
                    businessError.statusCode = response.statusCode
                    businessError.statusMessage = error.statusMessage
                    completion(.failure(businessError ?? NetworkError()), response.statusCode)
                } catch {
                    completion(.failure(NetworkError.parseError), response.statusCode)
                }
            }
        case .failure(let error):
            let customError = NetworkError(error: error)
            completion(.failure(customError), error.errorCode)
        }
    }
    
    func fetch<T: Codable>(endPoint: TargetType, completion: @escaping(
        _ result: Swift.Result< T,
    NetworkError>,
    _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(endPoint)) { result in
            
                self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
