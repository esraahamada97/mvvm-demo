//
//  MovieListsResponse.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct MovieListsResponse<T: Codable>: Codable {
    let page: Int?
    // T for one object
    let results: T?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
