//
//  CollectionView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct PopularCollectionView: View {
    let movies: [Movie]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    ForEach(movies.indices, id: \.self) { index in
                        PosterView(movie: movies[index], rank:String(index+1))
                    }
                }
                .padding(.leading, 30.0)
            }
            .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
        }
    }
}

//#Preview {
//    CollectionView()
//}
