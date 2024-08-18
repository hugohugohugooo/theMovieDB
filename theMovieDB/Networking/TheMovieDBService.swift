//
//  TheMovieDBService.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

class TheMovieDBService: TheMovieDBProtocol {
    //TODO: Cleanup env variables
    private let baseURL = "https://api.themoviedb.org/3"
    private let authKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYmYxMDA1NDFiY2IwODI4NGQwZjEzMTM3MTY5YTc0NiIsIm5iZiI6MTcyMzU5NjA5My4wNzY0NDcsInN1YiI6IjY2YmJmYzNkOWEzNzk0MTM2ODcxYWYwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PMQxmIVH10Jx0bdFbYzku-uXbh7c-F_8FQrWHbiZLJM"
    private let urlSession = URLSession.shared
    private let jsonDecoder = APIUtils.jsonDecoder
    
    func prepareRequest(with url: URL, cachePolicy: URLRequest.CachePolicy) -> URLRequest {
        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "\(authKey)"
        ]
        
        return request
    }
    
    func fetchMovies(for endpoint: MovieEndpoints) async throws -> [Movie] {
        guard let url = URL(string: "\(baseURL)/movie/\(endpoint.rawValue)") else {
            throw URLError(.badURL)
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        var request = self.prepareRequest(with: components.url!, cachePolicy: .reloadRevalidatingCacheData);
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse = try APIUtils.jsonDecoder.decode(MovieResponse.self, from: data)
        return apiResponse.results
    }
    
    func fetchMovie(id: Int) async throws -> Movie {
        guard let url = URL(string: "\(baseURL)/movie/\(id)") else {
            throw URLError(.badURL)
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var request = self.prepareRequest(with: components.url!, cachePolicy: .reloadRevalidatingCacheData);
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse = try APIUtils.jsonDecoder.decode(Movie.self, from: data)
        return apiResponse
    }
    
    func search(for text: String) async throws -> [Movie] {
        guard let url = URL(string: "\(baseURL)/search/movie") else {
            throw URLError(.badURL)
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "query", value: text),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        var request = self.prepareRequest(with: components.url!, cachePolicy: .reloadRevalidatingCacheData);
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse = try APIUtils.jsonDecoder.decode(MovieResponse.self, from: data)
        return apiResponse.results
    }

    
}
