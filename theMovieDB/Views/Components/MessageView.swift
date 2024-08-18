//
//  MessageView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 17/8/24.
//

import SwiftUI

struct MessageView: View {
    var title: String
    var description: String
    var image: Image = Image(systemName: "message")
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center) {
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment:.center, spacing: 10) {
                        image
                            .font(.system(size: 50))
                        Divider()
                        Text(title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text(description)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .foregroundColor(Colors.white.value)
        .background(Colors.background.value)
    }
}

#Preview {
    MessageView(title: "We're sorry! We cant find that movie title! :(", description: "Find your movies by name.")
}
