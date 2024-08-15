//
//  MovieViewModel.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import Foundation

@MainActor
class MovieViewModel : ObservableObject {
    @Published var popularMovies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiService: TmdbAPI
    
    init(apiService: TmdbAPI = APIService()) {
        self.apiService = apiService;
    }
    
    func getPopularMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            popularMovies = try await apiService.fetchPopularMovies()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
