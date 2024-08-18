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
            ZStack(alignment:.center) {
                Colors.background.value
                VStack(alignment: .leading) {
                    SearchBar(searchText: $searchText) {
                        Task {
                            await self.searchViewModel.search(for:searchText)
                        }
                    }
                    if self.searchViewModel.results.isEmpty {
                        MessageView(title: "Try searching for something!", description: "Results will display when you hit the search button.", image: Image(systemName: "magnifyingglass.circle.fill"))
                    } else {
                        MovieListView(movies: self.searchViewModel.results)
                    }
                }
            }
            .padding(.horizontal, 15)
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
    }
}

#Preview {
    return SearchView()
}


