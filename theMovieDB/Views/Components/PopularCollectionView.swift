//
//  CollectionView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct PopularCollectionView: View {
    let movies: [Movie]
    var spacing = 30.0
    var itemWidth = 90.0
    var itemHeight = 160.0
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: spacing) {
                ForEach(movies) { movie in
                    RankedCardView(movie: movie)
                        .frame(width: itemWidth, height: itemHeight)
                }
            }
        }
        .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    CollectionView()
//}
