//
//  MovieDetailView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var movieViewModel = MovieViewModel()
    var movieId: Int
    
    var body: some View {
        NavigationStack {
            ZStack(alignment:.top) {
                Colors.background.value
                if self.movieViewModel.isLoading {
                    ZStack(alignment:.center) {
                        Colors.background.value
                        Spacer()
                        ProgressView().tint(Color.gray)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let errorMessage = self.movieViewModel.errorMessage {
                    Text(errorMessage)
                    //TODO: Show error view here
                } else {
                    VStack(alignment: .leading) {
                        if let movie = self.movieViewModel.movie {
                            HeaderView(movie: movie)
                            DetailsView(movie: movie)
                                .offset(y:-70)
                        }
                    }
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
            ToolbarItem(placement: .primaryAction) {
                Button("", systemImage: "bookmark") {
                    
                }
            }
        }
        .toolbarBackground(Colors.background.value, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .task {
            Task {
                await self.movieViewModel.completeMovieDetails(for: movieId)
            }
        }
    }
}

struct HeaderView: View {
    let movie: Movie
    var body: some View {
        ZStack {
            // Header
            AsyncImage(url: movie.backdropURL, transaction: Transaction(animation: .easeIn(duration: TimeInterval(0.1)))
            ) { phase in
                VStack {
                    if let image = phase.image {
                        image.resizable()
                    } else  {
                        Color.black
                    }
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
                AsyncImage(url:movie.posterURL,
                           transaction: Transaction(animation: .easeIn(duration: TimeInterval(0.1)))                ) { image in
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
                      "N/A", systemImage: "calendar")
                Label(movie.durationText, systemImage: "clock")
                Label(movie.genres?.first?.name ?? "N/A", systemImage: "ticket")
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
    MovieDetailView(movieId: 533535)
}
