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
                Label("Rating", systemImage: "star")
                Label("Genre", systemImage: "ticket")
                Label("Release Date", systemImage: "calendar")
                Label("Duration", systemImage: "clock")
            }
        }
    }
}

#Preview {
    MovieItemView()
}
