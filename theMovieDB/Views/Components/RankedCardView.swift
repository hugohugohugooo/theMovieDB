//
//  RankedCardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct RankedCardView: View {
    let rank = "00"
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
//            Image("ForSplash")
//                .resizable()
//                .scaledToFill()
//                .clipped()
//            
            Text(rank)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(10)
                .offset(x: -20, y: 20)
        }
    }
}

#Preview {
    RankedCardView()
}
