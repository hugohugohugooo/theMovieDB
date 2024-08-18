//
//  WatchListView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct WatchListView: View {
    @StateObject private var watchListViewModel = WatchListViewModel.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                if self.watchListViewModel.movies.count == 0 {
                    MessageView(title: "There is no movie yet!", description: "Add your movies by tapping on the Bookmark icon on any movie.", image: Image(systemName: "bookmark.circle.fill"))
                } else {
                    MovieListView(movies: self.watchListViewModel.movies)
                }
            }
        }
        .background(Colors.background.value)
        .foregroundColor(Colors.white.value)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Watch List")
                    .fontWeight(.bold)
                    .foregroundColor(Colors.white.value)
            }
        }
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(Colors.background.value, for: .navigationBar)
    }
}

//#Preview {
//    WatchListView()
//}
