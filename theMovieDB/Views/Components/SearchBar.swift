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
    var onTextFieldTapAction: () -> Void = { }
    
    var body: some View {
        HStack {
            ZStack {
                HStack(alignment: .center) {
                    TextField("", text: $searchText, prompt: Text("Search"))
                    .textFieldStyle(.plain)
                    .cornerRadius(12)
                    .simultaneousGesture(TapGesture().onEnded {
                      onTextFieldTapAction()
                    })
                    .frame(height: 44)
                    Button("", systemImage: "magnifyingglass") {
                        searchAction()
                    }
                }
                .foregroundColor(Colors.grey.value)
                .padding(.horizontal)
                .background(Colors.white.value, in: Capsule())
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
