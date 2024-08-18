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
        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
            AsyncImage(
                url: movie.posterURL,
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    ZStack(alignment: .center) {
                        ProgressView().tint(Color.gray)
                    }
                case .success(let image):
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
                                    .fontWeight(.bold)
                                    .foregroundColor(Colors.grey.value)
                                    .shadow(color: Colors.highlightColor.value, radius: 1)
                            }
                        }
                    }
                    .scaledToFill()
                case .failure:
                    Image(systemName: "wifi.slash")
                @unknown default:
                    EmptyView()
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


//#Preview {
//    RankedCardView()
//}
