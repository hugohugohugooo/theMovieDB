//
//  ListView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct MovieListView: View {
    var movies: [Movie]
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                ForEach(movies.indices, id: \.self) { index in
                    MovieItemView(movie: movies[index])
                        .frame(height: 150)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}
//
//#Preview {
//    MoviesListView()
//}
