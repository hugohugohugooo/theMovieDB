//
//  HomeView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var popularViewModel = MoviesViewModel()
    @StateObject private var nowPlayingViewModel = MoviesViewModel()
    @StateObject private var upcomingViewModel = MoviesViewModel()
    @StateObject private var topRatedViewModel = MoviesViewModel()

    @State private var searchText: String = ""
    @State private var selectedTab: Int = 0
    @Binding var tabSelection: Int
    
    private var selectedViewModel: MoviesViewModel? {
        switch selectedTab {
            case 0:
                return nowPlayingViewModel
            case 1:
                return upcomingViewModel
            case 2:
                return topRatedViewModel
        default:
            return nil
        }
    }
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        //Header
                        VStack(alignment: .leading) {
                            Text("What do you want to watch?")
                                .font(.headline)
                            SearchBar(searchText: $searchText, searchAction: {
                                tabSelection = 1
                            }) {
                                tabSelection = 1
                            }
                        }
                        .padding(.all)
                        .foregroundStyle(.white)
                        
                        // Popular Movies
                        if let popularMovies = popularViewModel.movies {
                            PopularCollectionView(movies: popularMovies)
                                .frame(height:geometry.size.height * 0.45)
                        } 
                        // Categories
                        VStack(alignment: .leading) {
                            Picker("", selection: $selectedTab) {
                                Text("Now playing").tag(0)
                                Text("Upcoming").tag(1)
                                Text("Top rated").tag(2)
                            }
                            .pickerStyle(.segmented)
                            .padding(.bottom, 10)
                            .tint(Colors.white.value)
                        }
                        
                        let columns: [GridItem] = Array(repeating: .init(), count: 3)
                        
                        LazyVGrid(columns: columns) {
                            if let movies = selectedViewModel?.movies {
                                ForEach(0..<6) { index in
                                    PosterView(movie: movies[index])
                                }
                            } else if let errorMessage = selectedViewModel?.errorMessage {
                                MessageView(title: "Uh oh! Something went wrong!", description: errorMessage, image: Image(systemName: "xmark.circle.fill"))
                            }
                        }
                    }
                }
                .background(Colors.background.value)
                .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
            }
        }
        .task {
            Task {
                await popularViewModel.getMovies(for: .popular)
                await upcomingViewModel.getMovies(for:.upcoming)
                await nowPlayingViewModel.getMovies(for: .nowPlaying)
                await topRatedViewModel.getMovies(for:.topRated)
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
