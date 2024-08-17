//
//  Movie.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]
}

struct Movie: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    var backdropPath: String?
    var posterPath: String?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
}
