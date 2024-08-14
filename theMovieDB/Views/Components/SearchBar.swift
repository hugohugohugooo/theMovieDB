//
//  SearchBar.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 40)
                    .cornerRadius(12)
                    .foregroundColor(.red)
                HStack(alignment: .center) {
                    Spacer()
                    TextField("Search", text: $searchText)
                    .frame(height: 50)
                    .textFieldStyle(.plain)
                    .cornerRadius(12)
                    Image(systemName: "magnifyingglass")
                    Spacer()
                }
                .foregroundColor(Colors.white.value)
                .background(Colors.background.value)
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var searchText = "Star wars"
        var body: some View {
            SearchBar(searchText: $searchText)
        }
    }
    return Preview()
}
