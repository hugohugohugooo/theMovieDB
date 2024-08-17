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
        NavigationStack {
            GeometryReader { geometry in
                VStack(alignment:.leading) {
                    ZStack {
                        // Header
                        AsyncImage(url: movie.backdropURL) { image in
                            VStack {
                                image.image?.resizable()
                            }
                        }
                        Image(systemName: "play.circle")
                    }
                    .frame(width: geometry.size.width, height:geometry.size.width * 9/16)
                }
            }
            .background(Colors.background.value)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(movie.title)
                    .foregroundColor(Colors.white.value)
            }
        }
        .toolbarBackground(Colors.background.value, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)

    }
}

//#Preview {
//    MovieDetailView()
//}
