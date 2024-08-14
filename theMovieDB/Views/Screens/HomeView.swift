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
        VStack(alignment: .leading) {
            Text("What do you want to watch?")
            SearchBar(searchText: $searchText)
        }
    }
}

#Preview {
    HomeView()
}
