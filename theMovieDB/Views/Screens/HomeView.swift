//
//  HomeView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = "Star Wars";
    @State private var selectedTab: CGFloat = 0
    
    private let items = [Card(), Card(), Card(), Card(), Card(), Card()]
    
    var body: some View {
        GeometryReader { geometryReader in
            ScrollView {
                VStack(alignment: .leading) {
                    //Header
                    Text("What do you want to watch?")
                    SearchBar(searchText: $searchText)
                    
                    // Popular
                    HCollectionView(items: items, spacing: 20, itemWidth: 90, itemHeight: 160)
                    
                    // Categories
                    VStack(alignment: .leading) {
                                Picker("", selection: $selectedTab) {
                                    Text("Now playing").tag(0)
                                    Text("Upcoming").tag(1)
                                    Text("Top rated").tag(2)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .padding(.bottom, 10)
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
            .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
        }
       
    }
}

#Preview {
    HomeView()
}
