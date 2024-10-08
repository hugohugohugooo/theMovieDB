//
//  MovieViewModel.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 17/8/24.
//

import Foundation

@MainActor
class MovieViewModel : ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiService: TheMovieDBProtocol
    
    init(apiService: TheMovieDBProtocol = TheMovieDBService()) {
        self.apiService = apiService;
    }
    
    func completeMovieDetails(for movieId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            movie = try await apiService.fetchMovie(id: movieId)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
