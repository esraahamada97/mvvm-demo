//
//  NetworkManager.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable all
class NetworkManager {
    
    typealias MoyaCompletion = Result<Moya.Response, MoyaError>
    typealias NetworkCompletion<T: Codable> = (_ result: Swift.Result<T, NetworkError>,
        _ statusCode: Int?) -> Void
    
    static var networkConfig: NetworkDefaults {
        return NetworkManager.shared._networkConfig!
    }
    
    static var shared: NetworkManager!
    internal var _networkConfig: NetworkDefaults? //swiftlint:disable:this identifier_name
    
//    let accessTocken = AccessTokenPlugin(tokenClosure: { _ in
//        (NetworkManager.shared?.getAccessToken() ?? "")
//    })
    
   // var getAccessToken: () -> (String)
    
    var provider: MoyaProvider<MultiTarget>!
    
    
//    init(config: NetworkDefaults, getAccessToken: @escaping () -> (String)) {
        init(config: NetworkDefaults) {
        self._networkConfig = config
        //self.getAccessToken = getAccessToken
        
        NetworkManager.shared = self
        
        let headerPlugin = StaticHeaderPlugin(
            headers: [
                "Content-Type": "application/json; charset=utf-8"
        ])
        
        //        AuthProvider = MoyaProvider<AuthService>(session: DammaSessionManager.shared,
        //                                                 plugins: [NetworkLoggerPlugin(), headerPlugin])
        
//        provider = MoyaProvider<MultiTarget>(session: MoviesDBSessionManager.shared,
//                                             plugins: [NetworkLoggerPlugin(), headerPlugin, accessTocken])
        
        provider = MoyaProvider<MultiTarget>(session: MoviesDBSessionManager.shared,
                                                    plugins: [NetworkLoggerPlugin(), headerPlugin])
    }
}

public struct StaticHeaderPlugin: PluginType {
    
    var headers: [String: String] = [:]
    
    public init(headers: [String: String]) {
        self.headers = headers
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        
        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
