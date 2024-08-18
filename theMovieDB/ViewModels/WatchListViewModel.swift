//
//  WatchListViewModel.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 17/8/24.
//

import Foundation

@MainActor
class WatchListViewModel : ObservableObject {
    static let shared: WatchListViewModel =  {
        let instance = WatchListViewModel()
        instance.movies = instance.loadFromLocalStorage() ?? []
        return instance
    }()
    private init(
        
    ) {}
    
    @Published var movies: [Movie] = []
    private let watchListKey = "myWatchList"
    
    private func loadFromLocalStorage() -> [Movie]? {
        if let savedData = UserDefaults.standard.data(forKey: watchListKey) {
            let decoder = JSONDecoder()
            if let loadedObjects = try? decoder.decode([Movie].self, from: savedData) {
                return loadedObjects
            }
        }
        return nil
    }
    
    private func saveMoviesToLocalStorage(_ movies: [Movie]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movies) {
            UserDefaults.standard.set(encoded, forKey: watchListKey)
        }
    }
    
    func handle(_ movie: Movie) {
        if self.hasMovie(withId: movie.id) {
            self.removeMovie(withId: movie.id)
        } else {
            self.add(movie)
        }
    }
    
    func add(_ movie: Movie) {
        var updatedMovies = self.movies
        updatedMovies.append(movie)
        movies = updatedMovies
        self.saveMoviesToLocalStorage(movies)
    }
    
    func removeMovie(withId movieId: Int) {
        let updatedMovies = self.movies.filter { $0.id != movieId }
        movies = updatedMovies
        self.saveMoviesToLocalStorage(movies)
    }
    
    func hasMovie(withId movieId: Int) -> Bool {
        return self.movies.contains(where: { movie in
            movie.id == movieId
        })
    }
}
