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
            ZStack(alignment:.top) {
                Colors.background.value
                VStack(alignment: .leading) {
                    HeaderView(movie: movie)
                    DetailsView(movie: movie)
                        .offset(y:-70)
                }
            }
        }
        .background(Colors.background.value)
        .foregroundColor(Colors.white.value)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Detail")
                    .fontWeight(.bold)
                    .foregroundColor(Colors.white.value)
            }
        }
        .toolbarBackground(Colors.background.value, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

struct HeaderView: View {
    let movie: Movie
    var body: some View {
        ZStack {
            // Header
            AsyncImage(url: movie.backdropURL) { image in
                VStack {
                    image.image?.resizable()
                }
            }
            Button("", systemImage: "play.circle") {
                // TODO: Open video
            }
            .foregroundColor(Colors.white.value)
            .font(.system(size: 100))
            .opacity(0.8)
            
            ratingView(movie: movie)
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}

struct ratingView: View {
    let movie: Movie
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Label(movie.ratingText, systemImage: "star")
                    .padding(10)
                    .foregroundColor(Colors.orange.value)
                    .background(.thinMaterial, in: .rect(cornerRadius: 8.0))
                    .environment(\.colorScheme, .dark)
            }
        }
        .padding()
    }
}

struct DetailsView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment:.leading, spacing: 15) {
            HStack(alignment: .lastTextBaseline, spacing: 15) {
                AsyncImage(url:movie.posterURL) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(9/16, contentMode:.fit)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                }
                .containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
                // Title
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .truncationMode(.tail)
            }
        
            // Details
            HStack(alignment:.center) {
                Spacer()
                Label(movie.releaseDate ??
                      "n/a", systemImage: "calendar")
                Label(movie.durationText, systemImage: "clock")
                Label(String(movie.id), systemImage: "ticket")
                Spacer()
            }
            .font(.subheadline)
            .foregroundColor(Color.gray)
            
            // Overview
            Text(movie.overview)
                .font(.body)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    MovieDetailView(movie: .init(id: 0, title: "Star Wars", overview: "This is Star Wars.", voteAverage: 4.5, voteCount: 900, runtime: 12000, releaseDate: "2020"))
}
