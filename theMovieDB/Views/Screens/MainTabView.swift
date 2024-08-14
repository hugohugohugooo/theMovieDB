//
//  MainTabView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        // todo: make the tab items' creation more dynamic
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
                Text("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)
            
            NavigationStack() {
                Text("Watch List")
            }
            .tabItem {
                Text("Watch list")
                Image(systemName: "bookmark.fill")
            }
            .tag(2)
                
        }
        .tint(Colors.blue.value)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .gray
            UITabBarItem.appearance().badgeColor = UIColor(Colors.orange.value)
            UITabBar.appearance().backgroundColor = UIColor(Colors.grey.value)
        })
    }
}

#Preview {
    MainTabView()
}
