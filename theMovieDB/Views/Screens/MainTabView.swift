//
//  MainTabView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        // todo: make the tab items' creation dynamic
        TabView() {
            NavigationStack() {
                HomeView()
            }
            .tabItem {
                Text("Home")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
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
                Text("Watch list")
                Image(systemName: "bookmark.fill")
            }
            .tag(2)
        }
        .tint(Colors.highlightColor.value)
        .toolbarBackground(Colors.background.value, for: .tabBar)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .gray
            UITabBarItem.appearance().badgeColor = UIColor(Colors.orange.value)
            UITabBar.appearance().backgroundColor = UIColor(Colors.background.value)
        })
    }
}

#Preview {
    MainTabView()
}
