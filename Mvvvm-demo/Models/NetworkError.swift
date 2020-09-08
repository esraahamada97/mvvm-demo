//
//  NetworkError.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//
import Foundation
import Moya
import Alamofire

enum `Type`:String, Codable {
    case business
    case system
    case mapping
    case network
}

struct NetworkError: Error, Codable {
    
    var message: String?
    var type: Type?
    var statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case message = "status_message"
        case type
        case statusCode = "status_code"
    }
    
    init() {}
    
    init(error: MoyaError) {
        
        self.message = error.errorDescription
        
        if case let MoyaError.underlying(underlying, _) = error ,
            case let AFError.sessionTaskFailed(error: urlErrorDomain) = underlying {
            self.message = urlErrorDomain.localizedDescription
        }
        
        // handel no inernet error message and session expire
        switch error {
        case .underlying(let error, _):
            self.type = .system
            print(error)
        default :
            print(error)
            print(error.localizedDescription)
            self.type = .mapping
        }
    }
    
    init(error: Error) {
        print(error)
        print(error.localizedDescription)
        self.type = .mapping
    }
}

extension NetworkError {
    
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        print(error.localizedDescription)
        return error
    }()
}

extension NetworkError {
    func errorMessage() -> String {
            return self.message ?? ""
    }
}
