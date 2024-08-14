//
//  HomeView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = "Star Wars";
    
    var body: some View {
        GeometryReader { geometryReader in
            ScrollView {
                VStack(alignment: .leading) {
                    Text("What do you want to watch?")
                    SearchBar(searchText: $searchText)
                    HCollectionView(items: [Card(), Card(), Card(), Card(), Card(), Card()], spacing: 20, itemWidth: 90, itemHeight: 160)
                }
            }
            .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
        }
       
    }
}

#Preview {
    HomeView()
}
