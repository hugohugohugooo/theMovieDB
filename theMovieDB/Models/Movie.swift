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

struct MovieVideosResponse: Codable {
    var results: [MovieVideo]
}

struct MovieGenre: Codable {
    let name: String
}

struct MovieVideo: Codable, Identifiable {
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}

struct Movie: Codable, Identifiable, Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let title: String
    var backdropPath: String?
    var posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    let genres: [MovieGenre]?
    let videos: MovieVideosResponse?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "N/A"
        }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: TimeInterval(runtime) * 60) ?? "N/A"
    }
    
    var yearText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        guard let releaseDate = self.releaseDate, let date = dateFormatter.date(from: releaseDate) else {
            return "N/A"
        }
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        return yearFormatter.string(from: date)
    }
    
    var ratingText: String {
        return String(round(self.voteAverage * 10) / 10.0)
    }
}
