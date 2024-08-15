//
//  HomeView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var popularViewModel = MovieViewModel()
    @State private var searchText: String = "Star Wars";
    @State private var selectedTab: CGFloat = 0
    
    private var popularMovies: [Movie]?
    
    
    var body: some View {
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
                    Group {
                        if popularViewModel.isLoading {
                            ProgressView()
                        } else if let errorMessage = popularViewModel.errorMessage {
                            Text(errorMessage)
                            //TODO: Show error view here
                        } else {
                            PopularCollectionView(movies: popularViewModel.movies)
                                .frame(height:geometry.size.height * 0.4)
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
                    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

                    LazyVGrid(columns: columns, spacing: 0) {
                                    ForEach(1...6, id: \.self) { number in
                                        Image("ForSplash")
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                            .cornerRadius(1.0)
                                    }
                                }
                }
            }
            .background(Colors.background.value)
            .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
        }
       
    }
}

//#Preview {
//    HomeView()
//}
