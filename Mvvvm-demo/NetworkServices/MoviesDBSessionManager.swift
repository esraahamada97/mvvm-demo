//
//  MoviesDBSessionManager.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Alamofire

class MoviesDBSessionManager {
    
    static let shared = MoviesDBSessionManager().manager
    
    var manager: Session
    
    private init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 200
        configuration.timeoutIntervalForResource = 200
        manager = Session(configuration: configuration)
    }
}
