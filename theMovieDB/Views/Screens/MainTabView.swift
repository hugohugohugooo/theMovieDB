//
//  MainTabView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var upcomingViewModel = MoviesViewModel()

    var body: some View {
        // TODO: make the tab items' creation dynamic
        Group {
            TabView() {
                NavigationStack() {
                    HomeView()
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
                
                NavigationStack() {
                    SearchView()
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
                
                NavigationStack() {
                    WatchListView()
                }
                .tabItem {
                    Label("Watch List", systemImage: "bookmark.fill")
                    
                    Text("Watch list")
                    Image(systemName: "bookmark.fill")
                }
                .tag(2)
            }
            // TODO: Add blue divider line
        }
    }
}

#Preview {
    MainTabView()
}
