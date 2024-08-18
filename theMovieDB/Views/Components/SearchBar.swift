//
//  SearchBar.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var searchAction: () -> Void
    
    var body: some View {
        HStack {
            ZStack {
                HStack(alignment: .center) {
                    TextField("Search", text: $searchText)
                    .frame(height: 50)
                    .textFieldStyle(.plain)
                    .cornerRadius(12)
                    Button("", systemImage: "magnifyingglass") {
                        searchAction()
                    }
                }
                .padding(.horizontal)
                .foregroundColor(Colors.white.value)
                .background(Colors.grey.value, in: Capsule())
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var searchText = "Star wars"
        var body: some View {
            SearchBar(searchText: $searchText) {
                
            }
        }
    }
    return Preview()
}
