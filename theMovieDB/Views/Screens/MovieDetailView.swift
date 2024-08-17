//
//  MovieDetailView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment:.leading) {
                ZStack {
                    // Header
                    AsyncImage(url: movie.backdropURL) { image in
                        
                    }
                    Image(systemName: "play.circle")
                    
                }
                
            }
        }
    }
}

//#Preview {
//    MovieDetailView()
//}
