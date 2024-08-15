//
//  Movie.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    var poster_path: String
}
