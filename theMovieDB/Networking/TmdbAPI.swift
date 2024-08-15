//
//  WatchDBAPI.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

protocol TmdbAPI {
    func fetchPopularMovies() async throws -> [Movie]
}

class APIService: TmdbAPI {
    //TODO: Cleanup env variables
    let baseURL = Bundle.main.object(forInfoDictionaryKey: "theMovieDB_Base_URL") ?? "https://api.themoviedb.org/3"
    private let authKey = Bundle.main.object(forInfoDictionaryKey: "theWatchDB_API_Key") ?? "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYmYxMDA1NDFiY2IwODI4NGQwZjEzMTM3MTY5YTc0NiIsIm5iZiI6MTcyMzU5NjA5My4wNzY0NDcsInN1YiI6IjY2YmJmYzNkOWEzNzk0MTM2ODcxYWYwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PMQxmIVH10Jx0bdFbYzku-uXbh7c-F_8FQrWHbiZLJM"
    
    func fetchPopularMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(baseURL)/movie/popular") else {
            throw URLError(.badURL)
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(authKey)"
        ]

        let (data, response) = try await URLSession.shared.data(for: request)
        print("Data: \(String(decoding: data, as: UTF8.self))")
        print("Response: \(response)")
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse = try APIUtils.jsonDecoder.decode(MovieResponse.self, from: data)
        return apiResponse.results
    }
}
