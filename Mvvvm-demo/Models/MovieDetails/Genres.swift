//
//  Genres.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct Genres: Codable {
    let movieId: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case name 
    }
    
}
