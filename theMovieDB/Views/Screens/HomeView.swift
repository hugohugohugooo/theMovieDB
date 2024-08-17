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

    @State private var searchText: String = "Star Wars";
    @State private var selectedTab: CGFloat = 0
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        //Header
                        VStack(alignment: .leading) {
                            Text("What do you want to watch?")
                            SearchBar(searchText: $searchText)
                        }
                        .padding(.all)
                        .foregroundStyle(.white)
                        
                        // Popular Movies
                        VStack {
                            if popularViewModel.isLoading {
                                ProgressView()
                            } else if let errorMessage = popularViewModel.errorMessage {
                                Text(errorMessage)
                                //TODO: Show error view here
                            } else {
                                if let popularMovies = popularViewModel.movies {
                                    PopularCollectionView(movies: popularMovies)
                                        .frame(height:geometry.size.height * 0.45)
                                }
                            }
                        }
                        .onAppear {
                            Task {
                                await popularViewModel.getMovies(for:.popular)
                            }
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
                            //                        .background(Colors.background.value)
                            .tint(Colors.white.value)
                        }
                        
                        let columns: [GridItem] = Array(repeating: .init(), count: 3)
                        LazyVGrid(columns: columns) {
                            if let upcomingMovies = upcomingViewModel.movies {
                                ForEach(0..<6) { index in
                                    PosterView(movie: upcomingMovies[index])
                                }
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
                await upcomingViewModel.getMovies(for:.upcoming)
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
