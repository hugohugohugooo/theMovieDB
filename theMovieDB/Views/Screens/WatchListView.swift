//
//  WatchListView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 14/8/24.
//

import SwiftUI

struct WatchListView: View {
    var body: some View {
        List {
            MovieItemView()
        }
    }
}

#Preview {
    WatchListView()
}
