//
//  MovieModel.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
  let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let movieID: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIds: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {

        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case movieID = "id"
        case adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case title = "title"
        case voteAverage = "vote_average"
        case overview = "overview"
        case releaseDate = "release_date"
    }
}
