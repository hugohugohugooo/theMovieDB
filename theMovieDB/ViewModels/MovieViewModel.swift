//
//  MovieViewModel.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

@MainActor
class MovieViewModel : ObservableObject {
    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiService: TheMovieDBProtocol
    
    init(apiService: TheMovieDBProtocol = TheMovieDBService()) {
        self.apiService = apiService;
    }
    
    func getMovies(for endpoint: MovieEndpoints) async {
        isLoading = true
        errorMessage = nil
        
        do {
            movies = try await apiService.fetchMovies(for: endpoint)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
