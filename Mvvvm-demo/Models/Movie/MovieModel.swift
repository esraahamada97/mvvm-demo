//
//  MovieModel.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
  
    let posterPath: String?
    let movieID: Int?
    let originalTitle: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case movieID = "id"
        case originalTitle = "original_title"
        case title = "title"
    }
}
