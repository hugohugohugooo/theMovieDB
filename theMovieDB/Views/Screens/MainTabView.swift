//
//  MainTabView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var upcomingViewModel = MoviesViewModel()
    @State private var tabSelection: Int = 0

    var body: some View {
        Group {
            TabView(selection: $tabSelection) {
                NavigationStack() {
                    HomeView(tabSelection: $tabSelection)
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
                .toolbarBackground(.visible, for:.bottomBar,.navigationBar, .tabBar)
                .toolbarBackground(Colors.grey.value, for: .bottomBar, .navigationBar,.tabBar)
                // TODO: Add blue divider line
                
                NavigationStack() {
                    SearchView()
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
                .toolbarBackground(.visible, for:.bottomBar,.navigationBar, .tabBar)
                .toolbarBackground(Colors.grey.value, for: .bottomBar, .navigationBar,.tabBar)
                
                NavigationStack() {
                    WatchListView()
                }
                .tabItem {
                    Label("Watch List", systemImage: "bookmark.fill")
                    
                    Text("Watch list")
                    Image(systemName: "bookmark.fill")
                }
                .tag(2)
                .toolbarBackground(.visible, for:.bottomBar,.navigationBar, .tabBar)
                .toolbarBackground(Colors.grey.value, for: .bottomBar, .navigationBar,.tabBar)
            }
        }
    }
}

#Preview {
    MainTabView()
}
