//
//  NetworkResponse.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct NetworkResponse: Codable {
    //put base properties
    let isSuccess: Bool?
    let statusCode: Int?
    let statusMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
