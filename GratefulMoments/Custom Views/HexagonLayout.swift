//
//  HexagonLayout.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 19.03.2026.
//

import SwiftUI

enum HexagonLayout {
    case standart
    case large
    
    var size: CGFloat {
        switch self {
        case .standart:
            return 200.0
        case .large:
            return 350.0
        }
    }
    
    var timestampBottomPadding: CGFloat {
        return 0.08
    }
    
    var textBottomPadding: CGFloat {
        return 0.25
    }
    
    var timestampHeight: CGFloat {
        return size * (textBottomPadding - timestampBottomPadding)
    }
    
    var titleFont: Font {
        switch self {
        case .standart:
            return .headline
        case .large:
            return .title.bold()
        }
    }
    
    var bodyFont: Font {
        switch self {
        case .standart:
            return .caption2
        case .large:
            return .body
        }
    }
}
