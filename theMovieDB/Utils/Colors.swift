//
//  Colors.swift
//  theMovieDB
//
//  Created by Hugo Rodriguez S. on 13/8/24.
//

import Foundation
import SwiftUI

enum Colors {
    case grey
    case highlightColor
    case white
    case orange
    case background
}

extension Colors {
    var value: Color {
        switch self {
            case .grey:
                return Color("color.grey")
            case .highlightColor:
                return Color("color.highlight")
            case .white:
                return Color.white
            case .orange:
                return Color("color.orange")
            case .background:
                return Color("color.background")
        }
    }
}
