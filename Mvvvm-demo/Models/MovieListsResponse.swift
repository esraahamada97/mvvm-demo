//
//  MovieListsResponse.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class MovieListsResponse<T: Codable>: NetworkResponse {
    var page: Int?
    // T for one object
    var results: T?
    var totalPages: Int?
    let totalResults: Int? = 0

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
