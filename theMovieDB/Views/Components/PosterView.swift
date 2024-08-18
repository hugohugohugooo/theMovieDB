//
//  RankedCardView.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import SwiftUI

struct PosterView: View {
    private let spacing: CGFloat = 8.0
    private let cornerRadius = 5
    let movie: Movie
    var rank: String? = nil
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
            AsyncImage(
                url: movie.posterURL,
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    ZStack(alignment: .center) {
                        ProgressView().tint(Color.gray)
                    }
                case .success(let image):
                    ZStack(alignment: .bottomLeading) {
                        HStack(alignment: .top) {
                            Spacer()
                            VStack(alignment: .leading) {
                                image.resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .padding(.all, 8)
                                if rank != nil {
                                    Spacer()
                                        .frame(height: spacing*3)
                                }
                            }
                        }
                        if let rankText = rank {
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(rankText)
                                    .font(.system(size: 80))
                                    .fontWeight(.bold)
                                    .foregroundColor(Colors.background.value)
                                    .stroke(color: Colors.highlightColor.value, width: 1)
                            }
                        }
                    }
                    .scaledToFill()
                case .failure:
                    Image(systemName: "wifi.slash")
                @unknown default:
                    EmptyView()
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension View {
    func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue

    func body(content: Content) -> some View {
        if strokeSize > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }

    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }

    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            if let resolvedView = context.resolveSymbol(id: id) {
                context.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}

//#Preview {
//    RankedCardView()
//}
