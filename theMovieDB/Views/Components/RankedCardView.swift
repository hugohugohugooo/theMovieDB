//
//  RankedCardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct RankedCardView: View {
    let rank = "1"
    let movie: Movie
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            
            Text(rank)
                .font(.system(size: 80))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Colors.grey.value)
                .offset(x: -8, y: 8)
                .shadow(color: Colors.highlightColor.value, radius: 1)
        }
    }
}

//#Preview {
//    RankedCardView()
//}
