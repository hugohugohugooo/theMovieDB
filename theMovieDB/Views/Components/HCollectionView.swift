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

struct HCollectionView: View {
    let items: [Card]
    let spacing: CGFloat
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: spacing) {
                ForEach(items) { card in
                    CardView()
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
