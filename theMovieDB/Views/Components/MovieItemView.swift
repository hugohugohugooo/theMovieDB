//
//  MovieItemView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct MovieItemView: View {
    let movie: Movie
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(movieId: self.movie.id)) {
            HStack (alignment: .top, spacing: 16.0) {
                AsyncImage(url:movie.posterURL,
                           transaction: Transaction(animation: .default)
                ) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                    } else {
                        Color.black
                            .frame(maxHeight: .infinity)
                    }
                }
                .aspectRatio(9/16, contentMode:.fit)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)


                VStack(alignment: .leading) {
                    // Title
                    Text(movie.title)
                        .font(.headline)
                        .truncationMode(.tail)
                        .lineLimit(1)
                    Divider()
                    Group {
                        Label(movie.ratingText, systemImage: "star")
                            .foregroundColor(Colors.orange.value)
                        Label(movie.genres?.first?.name ?? "n/a", systemImage: "ticket")
                        Label(movie.yearText, systemImage: "calendar")
                        Label(movie.durationText, systemImage: "clock")
                    }
                    .font(.subheadline)
                }
            }
        }
    }
}

//#Preview {
//    let movie = Movie(id: 0, title: "Star Wars")
//    return MovieItemView(movie: movie)
//}
