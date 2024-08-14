//
//  MovieItemView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct MovieItemView: View {
    var body: some View {
        HStack (alignment: .top) {
            Image("ForSplash")
                .resizable()
                .scaledToFill()
                .clipped()
                .cornerRadius(1.0)
            VStack(alignment: .leading) {
                // Title
                Text("Spiderman")
                Spacer()
                
                // Rating
                HStack {
                    Image(systemName: "star")
                    Text("Rating")
                }
                
                // Genre
                HStack {
                    Image(systemName: "ticket")
                    Text("Genre")
                }
                
                // Release Date
                HStack {
                    Image(systemName: "calendar")
                    Text("Release date")
                }
                
                // Duration
                HStack {
                    Image(systemName: "clock")
                    Text("Duration")
                }
            }
        }
    }
}

#Preview {
    MovieItemView()
}
