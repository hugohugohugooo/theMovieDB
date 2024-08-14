//
//  CardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image("ForSplash")
                .resizable()
                .scaledToFill()
                .clipped()
                .cornerRadius(5.0)
        }
    }
}

#Preview {
    CardView()
}
