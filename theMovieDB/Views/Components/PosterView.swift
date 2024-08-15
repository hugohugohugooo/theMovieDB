//
//  RankedCardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct PosterView: View {
    let movie: Movie
    var rank: String? = nil
    
    var body: some View {
        AsyncImage(url: movie.posterURL){ image in
            ZStack(alignment: .bottomLeading) {
                HStack(alignment: .top) {
                    Spacer()
                    VStack(alignment: .leading) {
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        Spacer()
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
        } placeholder: {
            ProgressView()
        }
    }
}


//#Preview {
//    RankedCardView()
//}
