//
//  SearchView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment:.top) {
                Colors.background.value
                VStack(alignment: .leading) {
                    SearchBar(searchText: $searchText) {
                        Task {
                            await self.searchViewModel.search(for:searchText)
                        }
                    }
                    if self.searchViewModel.results.isEmpty {
                        Text("Try searching for something")
                    } else {
                        MovieListView(movies: self.searchViewModel.results)
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .background(Colors.background.value)
        .foregroundColor(Colors.white.value)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Search")
                    .fontWeight(.bold)
                    .foregroundColor(Colors.white.value)
            }
        }
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(Colors.background.value, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    return SearchView()
}


