//
//  SearchViewModel.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 17/8/24.
//

import Foundation

@MainActor
class SearchViewModel : ObservableObject {
    @Published var results: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiService: TheMovieDBProtocol
    
    init(apiService: TheMovieDBProtocol = TheMovieDBService()) {
        self.apiService = apiService;
    }
    
    func search(for searchText: String) async {
        isLoading = true
        errorMessage = nil
        results = []
        
        do {
            results = try await apiService.search(for: searchText)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
