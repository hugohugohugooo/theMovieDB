//
//  CollectionView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
}

struct PopularCollectionView: View {
    let items: [Card]
    var spacing = 30.0
    var itemWidth = 90.0
    var itemHeight = 160.0
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: spacing) {
                ForEach(items) { card in
                    RankedCardView()
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
