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
    case blue
    case white
    case orange
}

extension Colors {
    var value: Color {
        switch self {
            case .grey:
                return Color.black
            case .blue:
                return Color.blue
            case .white:
                return Color.white
            case .orange:
                return Color.orange
        }
    }
}
