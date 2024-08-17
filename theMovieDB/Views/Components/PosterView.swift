//
//  RankedCardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct PosterView: View {
    private let spacing: CGFloat = 8.0
    private let cornerRadius = 5
    let movie: Movie
    var rank: String? = nil
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(movie: movie)) {
            AsyncImage(url: movie.posterURL) { image in
                ZStack(alignment: .bottomLeading) {
                    HStack(alignment: .top) {
                        Spacer()
                        VStack(alignment: .leading) {
                            image.resizable()
                                .scaledToFit()
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                .padding(.all, 8)
                            if rank != nil {
                                Spacer()
                                    .frame(height: spacing*3)
                            }
                        }
                    }
                    if let rankText = rank {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(rankText)
                                .font(.system(size: 80))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Colors.grey.value)
                                .shadow(color: Colors.highlightColor.value, radius: 1)
                        }
                    }
                }
                .scaledToFill()
            } placeholder: {
                ProgressView()
            }
        }
    }
}


//#Preview {
//    RankedCardView()
//}
