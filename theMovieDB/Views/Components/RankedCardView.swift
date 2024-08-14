//
//  RankedCardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct RankedCardView: View {
    let rank = "1"
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image("ForSplash")
                .resizable()
                .scaledToFill()
                .clipped()
                .cornerRadius(5.0)
            
            Text(rank)
                .font(.system(size: 80))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Colors.grey.value)
                .offset(x: -8, y: 8)
                .shadow(color: Colors.blue.value, radius: 1)
        }
    }
}

#Preview {
    RankedCardView()
}
