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
            ZStack {
                HeaderView(movie: movie)
                GeometryReader { geometry in
                    HStack(alignment: .top) {
                        AsyncImage(url:movie.posterURL) { image in
                            image.image?.resizable()
                                .scaledToFit()
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                .padding(.all, 8)
                        }
                    }
                    .aspectRatio(9/16, contentMode: .fit)
                    .frame(width: geometry.size.width * 0.33)
                    .padding(.top, geometry.size.width * 9/16 * 0.7)
                    .padding(.leading, 32)
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
//    MovieDetailView(movie: .init(id: 0, title: "Star Wars", overview: "This is Star Wars.", voteAverage: 4.5, voteCount: 900, runtime: 12000))
//}

struct HeaderView: View {
    let movie: Movie
    var body: some View {
        GeometryReader { geometry in
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
                .opacity(0.7)
                
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
            .frame(width: geometry.size.width, height:geometry.size.width * 9/16)
        }
    }
}
