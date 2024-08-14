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

struct CollectionView: View {
    let cards: [Card]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(cards) { card in
                    CardView()
                        .frame(width: 90, height: 160)
                }
            }
        }
        .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    CollectionView()
//}
