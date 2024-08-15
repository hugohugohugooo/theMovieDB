//
//  WatchDBAPI.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

protocol TheMovieDBProtocol {
    func fetchMovies(for: MovieEndpoints) async throws -> [Movie]
}

enum MovieEndpoints: String {
    var id: String { rawValue }
    case popular
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
}


