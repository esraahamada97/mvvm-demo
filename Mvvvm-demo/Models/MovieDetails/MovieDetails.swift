//
//  MovieDetails.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct MovieDetails: Codable {
    let genres: [Genres]?
    let movieId: Int?
    let originalTitle: String?
    let posterPath: String?
    let title: String?

    enum CodingKeys: String, CodingKey {

        case genres = "genres"
        case movieId = "id"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case title = "title"
    }

}
